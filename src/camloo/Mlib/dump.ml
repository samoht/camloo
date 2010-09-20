(* The compiler entry points *)

#open "obj";;
#open "misc";;
#open "const";;
#open "lexer";;
#open "parser";;
#open "location";;
#open "syntax";;
#open "builtins";;
#open "hashtbl";;
#open "globals";;
#open "modules";;
#open "types";;
#open "ty_error";;
#open "typing";;
#open "ty_decl";;
#open "pr_decl";;
#open "ty_intf";;
#open "front";;
#open "instruct";;
#open "compiler";;
#open "lam";;
#open "emit_phr";;
#open "printexc";;
#open "prim";;
#open "printf";;

(* Compiling an implementation *)

let dump_impl_phrase outstream (Impl(desc,loc)) =
  reset_type_expression_vars();
  begin match desc with
    Zexpr expr ->
      let ty = type_expression loc expr in
                  (dump_lambda outstream false (translate_expression expr));
      if !verbose then print_expr ty
  | Zletdef(rec_flag, pat_expr_list) ->
      let env = type_letdef loc rec_flag pat_expr_list in
         (if rec_flag
          then dump_lambda outstream 
                           true 
                           (translate_letdef_rec loc pat_expr_list)
          else dump_lambda outstream 
                           false 
                           (translate_letdef loc pat_expr_list));
      if !verbose then print_valdef env
  | Ztypedef decl ->
      let ty_decl = type_typedecl loc decl in
      if !verbose then print_typedecl ty_decl
  | Zexcdef decl ->
      let ex_decl = type_excdecl loc decl in
      if !verbose then print_excdecl ex_decl
  | Zimpldirective dir ->
      do_directive dir
  end
;;

let dump_imports outstream opened = 
   do_list ( function (name, filename) ->
     output_string outstream "(import "; 
     output_string outstream name;
     output_string outstream " \"";
     output_string outstream filename; output_string outstream "\")\n" )
   opened
;;
     
let dump_impl modname filename =
  let source_name = filename ^ ".ml"
  and obj_name = filename ^ ".lam" in
  let ic = open_in_bin source_name
  (* The source file must be opened in binary mode, so that the absolute
     seeks in print_location work. The lexer ignores both \n and \r,
     so this is OK on the Mac and on the PC. *)
  and oc = open_out obj_name in
  let lexbuf = lexing__create_lexer_channel ic in
    input_name := source_name;
    input_chan := ic;
    input_lexbuf := lexbuf;
    try
      while true do
        dump_impl_phrase oc (parse_impl_phrase lexbuf)
      done
    with End_of_file ->
      dump_imports oc (modules__get_ever_opened_modules ());
      close_in ic;
      close_out oc
    | x ->
      close_in ic;
      close_out oc;
      remove_file obj_name;
      raise x
;;

let dump_syntax_implementation modname filename =
  external_types := [];
  if file_exists (filename ^ ".mli") then begin
    try
      let intf = read_module (filename ^ ".zi") in
      start_compiling_implementation modname intf;
      enter_interface_definitions intf;
      dump_impl modname filename;
      check_interface intf;
      if !write_extended_zi then begin
        let ext_intf_name = filename ^ ".zix" in
        let oc = open_out_bin ext_intf_name in
        try
          write_compiled_interface oc;
          close_out oc
        with x ->
          close_out oc;
          remove_file (ext_intf_name);
          raise x
      end;
      kill_module modname
    with x ->
      remove_file (filename ^ ".zo");
      raise x
  end else begin
    let intf_name = filename ^ ".zi" in
    let oc = open_out_bin intf_name in
    try
      start_compiling_interface modname;
      dump_impl modname filename;
      write_compiled_interface oc;
      close_out oc
    with x ->
      close_out oc;
      remove_file intf_name;
      raise x
  end
;;

(* Compiling an interface *)

let mklib = ref false;;

let prims_to_dump = ref( [] : (string * string * int) list );;
let scheme_prims_to_dump = ref( [] : (string * string * string * string * int) list );;

let dump_intf_phrase (Intf(desc,loc)) =
  begin match desc with
    Zvaluedecl decl ->
      let dump_one_decl = function 
          (name, _, ValuePrim(Regprim, _, Pccall(cname, arity))) -> 
            prims_to_dump := (name, cname, arity) :: !prims_to_dump
        | (name, _, ValuePrim(Schemeprim(modname, filename), 
           _, 
           Pccall(cname, arity))) -> 
            scheme_prims_to_dump := 
             (name, cname, modname, filename, arity) :: !scheme_prims_to_dump
		| _ -> () in
      type_valuedecl loc decl;
      do_list dump_one_decl decl
  | Ztypedecl decl ->
      let ty_decl = type_typedecl loc decl in
      if !verbose then print_typedecl ty_decl
  | Zexcdecl decl ->
      let ex_decl = type_excdecl loc decl in
      if !verbose then print_excdecl ex_decl
  | Zintfdirective dir ->
      do_directive dir
  end
;;

let write_one_decl oc = function (name, cname, arity) ->
	if arity = 0 then
		output_string oc ("      " ^ cname ^ "\n")
	else begin
		output_string oc ("      (obj " ^ cname ^ " (");   
		for i = 0 to arity - 1 do output_string oc "obj " done;
		output_string oc (") \"" ^ cname ^ "\")\n")
	end
;;
  
let write_one_scheme_import_decl oc = function (_, cname, modname, filename, _) -> 
	output_string oc ("      (" ^ cname ^ " " ^ modname ^ " \"" ^ filename ^ "\")\n")
;;

let write_one_scheme_export_decl oc = function (_, cname, _, _, arity) -> 
	let rec args accu i = if i<1 then accu else args (" obj" ^ accu) (i-1) in
	if arity = 0 then
		output_string oc ("      " ^ cname ^ "\n")
	else
		output_string oc ("      (" ^ cname ^ (args "" arity) ^ ")\n")
;;

let write_one_scheme_define_decl oc = function (name, cname, _, _, arity) -> 
	let rec args accu i = if i<1 then accu else args (" x" ^ string_of_int i ^ accu) (i-1) in
	let args = args "" arity in
	if name <> cname then
		if arity = 0 then
			output_string oc ("(define " ^ name ^ " " ^ cname ^ "\n")
		else
			output_string oc ("(define (" ^ name ^ args ^ ") (" ^ cname ^ args ^ "))\n")
;;

let write_dumped_interface modname filename =
  if not !mklib then
    let source_name = filename ^ ".ml"
    and obj_name = filename ^ ".lam" in
    if not (file_exists source_name) then (
      let oc = open_out obj_name in
      close_out oc
	);
    let dump_name = filename ^ ".sci" in
	let extern = list_length !prims_to_dump > 0 in

	let import_id   =
		list_filter (fun (name, cname, modname,_,_) -> name=cname) !scheme_prims_to_dump in
	let import_diff =
		list_filter (fun (name, cname, modname,_,_) -> name<>cname) !scheme_prims_to_dump in
	let import = (list_length import_id > 0) or (list_length import_diff > 0) in

	if extern or import then (
		let oc = open_out dump_name in
		try
			output_string oc "(directives ";
			if extern then (
				output_string oc "\n   (extern\n";
				do_list (write_one_decl oc) !prims_to_dump;
				output_string oc "   )\n"
			);
			if import then (
				if list_length import_id > 0 then (
					output_string oc "\n   (from\n";
					do_list (write_one_scheme_import_decl oc) import_id;
					output_string oc "   )\n"
				);
				if list_length import_diff > 0 then (
					output_string oc "\n   (import\n";
					do_list (write_one_scheme_import_decl oc) import_diff;
					output_string oc "   )\n";
					output_string oc "\n   (export\n";
					do_list (write_one_scheme_export_decl oc) import_diff;
					output_string oc "   )\n"
				)
			);
			output_string oc ")\n";
			if import then
				do_list (write_one_scheme_define_decl oc) import_diff;
			close_out oc
		with x -> 
			close_out oc;
			remove_file dump_name;
			raise x
	)
	;;

let dump_interface modname filename =
  let source_name = filename ^ ".mli"
  and intf_name = filename ^ ".zi" in
  let ic = open_in_bin source_name (* See compile_impl *)
  and oc = open_out_bin intf_name in
    try
      start_compiling_interface modname;
      let lexbuf = lexing__create_lexer_channel ic in
      input_name := source_name;
      input_chan := ic;
      input_lexbuf := lexbuf;
      external_types := [];
      while true do
        dump_intf_phrase(parse_intf_phrase lexbuf)
      done
    with End_of_file ->
      close_in ic;
      write_compiled_interface oc;
      write_dumped_interface modname filename;
      close_out oc
    | x ->
      close_in ic;
      close_out oc;
      remove_file intf_name;
      raise x
;;   

