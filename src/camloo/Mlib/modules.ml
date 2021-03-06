(* modules.ml : handling of modules and global symbol tables *)

#open "misc";;
#open "const";;
#open "globals";;
#open "errors";;

(* Informations associated with module names *)

type module =
  { mod_name: string;                        (* name of the module *)
    mod_values: (string, value_desc global) hashtbl__t;
                                             (* table of values *)
    mod_constrs: (string, constr_desc global) hashtbl__t;
                                             (* table of constructors *)
    mod_labels: (string, label_desc global) hashtbl__t;
                                             (* table of labels *)
    mod_types: (string, type_desc global) hashtbl__t;
                                             (* table of type constructors *)
    mutable mod_type_stamp: int;             (* stamp for type constructors *)
    mutable mod_exc_stamp: int;              (* stamp for exceptions *)
    mutable mod_persistent: bool }
                      (* true if this interface comes from a .zi file *)
;;

let name_of_module    md = md.mod_name
and values_of_module  md = md.mod_values
and constrs_of_module md = md.mod_constrs
and labels_of_module  md = md.mod_labels
and types_of_module   md = md.mod_types
;;

(* The table of module interfaces already loaded in memory *)

let module_table = (hashtbl__new 37 : (string, module) hashtbl__t);;

let new_module nm =
  let md =
    { mod_name = nm;
      mod_values = hashtbl__new 17;
      mod_constrs = hashtbl__new 13;
      mod_labels = hashtbl__new 11;
      mod_types = hashtbl__new 7;
      mod_type_stamp = 0;
      mod_exc_stamp = 0;
      mod_persistent = false }
  in
    hashtbl__add module_table nm md; md
;;

(* To load an interface from a file *)

let use_extended_zi = ref false;;

let read_module filename =
  let ic = open_in_bin filename in
  try
    let md = (input_value ic : module) in
    close_in ic;
    md.mod_persistent <- true;
    md
  with End_of_file | Failure _ ->
    close_in ic;
    prerr_begline " Corrupted compiled interface file ";
    prerr_endline filename;
    raise Toplevel
;;

let ever_opened_modules = ref( [] : (string * string) list);;

let get_ever_opened_modules () = !ever_opened_modules;;

let load_module name =
  let fullname = find_in_path (name ^ ".zi") in
  let filename =
    if !use_extended_zi & file_exists (fullname ^ "x")
    then fullname ^ "x" else fullname in
  ever_opened_modules := (name, filename) :: !ever_opened_modules;
  read_module filename
;;

(* To find an interface by its name *)

let find_module filename =
  let modname = filename__basename filename in
  try
    hashtbl__find module_table modname
  with Not_found ->
    let md = load_module filename in
      hashtbl__add module_table modname md; md
;;

(* To remove the in-memory image of an interface *)

let kill_module name =
  hashtbl__remove module_table name
;;

(* The current state of the compiler *)

let default_used_modules = ref ([] : string list);;

let defined_module = ref (new_module "")
and used_modules = ref ([] : module list);;

let start_compiling_interface name =
  defined_module := new_module name;
  used_modules := map find_module !default_used_modules;;

let start_compiling_implementation name intf =
  start_compiling_interface name;
  !defined_module.mod_type_stamp <- intf.mod_type_stamp;
  !defined_module.mod_exc_stamp  <- intf.mod_exc_stamp;;

let compiled_module_name () =
  !defined_module.mod_name
;;

let defined_global name desc =
  { qualid = { qual=compiled_module_name(); id=name }; info = desc }
;;

let new_type_stamp () =
  let s = succ !defined_module.mod_type_stamp in
  !defined_module.mod_type_stamp <- s; s
;;

let new_exc_stamp () =
  let s = succ !defined_module.mod_exc_stamp in
  !defined_module.mod_exc_stamp <- s; s
;;

(* Additions to the module being compiled *)

let add_global_info sel_fct glob =
  let tbl = sel_fct !defined_module in
    if !toplevel then
      add_rollback (fun () -> hashtbl__remove tbl glob.qualid.id);
    hashtbl__add tbl glob.qualid.id glob
;;

let add_value = add_global_info values_of_module
and add_constr = add_global_info constrs_of_module
and add_label = add_global_info labels_of_module
and add_type = add_global_info types_of_module
;;

(* Find the descriptor for a reference to a global identifier.
   If the identifier is qualified (mod__name), just look into module mod.
   If the identifier is not qualified, look into the current module,
   then into all opened modules. *)

exception Desc_not_found;;

let find_desc sel_fct = function
    GRmodname q ->
      begin try
        hashtbl__find (sel_fct (find_module q.qual)) q.id
      with Not_found ->
        raise Desc_not_found
      end
  | GRname s ->
      begin try
        hashtbl__find (sel_fct !defined_module) s
      with Not_found ->
        let rec find_rec = function
          []       -> raise Desc_not_found
        | md::rest -> try hashtbl__find (sel_fct md) s
                      with Not_found -> find_rec rest
        in find_rec !used_modules
      end
;;

let find_value_desc = find_desc values_of_module
and find_constr_desc = find_desc constrs_of_module
and find_label_desc = find_desc labels_of_module
and find_type_desc = find_desc types_of_module
;;

let type_descr_of_type_constr cstr =
  let rec select_type_descr = function
    [] -> raise Desc_not_found
  | desc::rest ->
      if desc.info.ty_constr.info.ty_stamp = cstr.info.ty_stamp
      then desc
      else select_type_descr rest in
  select_type_descr
    (hashtbl__find_all
      (types_of_module (find_module cstr.qualid.qual))
      cstr.qualid.id)
;;

(* To write the interface of the module currently compiled *)

let write_compiled_interface oc =
  output_value oc !defined_module
;;

(* To flush all in-core modules coming from .zi files *)

let flush_module_cache () =
  let used = map (fun md -> md.mod_name) !used_modules in
  hashtbl__do_table
    (fun name md -> if md.mod_persistent then kill_module name)
    module_table;
  used_modules := map find_module used
;;


