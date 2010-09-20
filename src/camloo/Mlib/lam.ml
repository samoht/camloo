(*  back.ml : translation of lambda terms to lists of instructions. *)

#open "misc";;
#open "const";;
#open "lambda";;
#open "prim";;
#open "globals";;
#open "printf";;

let string_for_C_read s =
  let n = ref 0 in
    for i = 0 to string_length s - 1 do
      n := !n +
        (match nth_char s i with
           `"` | `\\` | `\n` | `\t` -> 2
          | c -> if is_printable c then 1 else 4)
    done;
    if !n == string_length s then s else begin
      let s' = create_string !n in
        n := 0;
        for i = 0 to string_length s - 1 do
          begin
            match nth_char s i with
              `"` -> set_nth_char s' !n `\\`; incr n; set_nth_char s' !n `"`
            | `\\` -> set_nth_char s' !n `\\`; incr n; set_nth_char s' !n `\\`
            | `\n` -> set_nth_char s' !n `\\`; incr n; set_nth_char s' !n `n`
            | `\t` -> set_nth_char s' !n `\\`; incr n; set_nth_char s' !n `t`
            | c ->
                if is_printable c then
                  set_nth_char s' !n c
                else begin
                  let a = int_of_char c in
                  set_nth_char s' !n `\\`;
                  incr n;
                  set_nth_char s' !n (char_of_int (48 + a / 64));
                  incr n;
                  set_nth_char s' !n (char_of_int (48 + (a / 8) mod 8));
                  incr n;
                  set_nth_char s' !n (char_of_int (48 + a mod 8))
                end
          end;
          incr n
        done;
        s'
      end
;;

let current_out_stream = ref stdout;;

let ps x = output_string !current_out_stream x;;
let pn x = output_char !current_out_stream `\n`;;
let pc x = output_char !current_out_stream x;;
let pi x = ps (string_of_int x);;
let pf x = fprintf !current_out_stream "%f" x; ();;

let prim_test = function
    PTeq -> ps "PTeq"
  | PTnoteq -> ps "PTnoteq"
  | PTnoteqimm p -> ps "PTnoteqimm"
  | PTlt -> ps "PTlt"
  | PTle -> ps "PTle"
  | PTgt -> ps "PTgt"
  | PTge -> ps "PTge";;

let rec dump_lam = function
    Lvar i -> ps "(Lvar "; pi i; ps ")"

  | Lconst s_c -> 
      ps "(Lconst ";
      dump_struct_constant s_c;
      ps ")"

  | Lapply ( l, ls ) ->
      ps "(Lapply ";
      dump_lam l; 
      dump_lams ls;
      ps ")"

  | Lfunction l -> 
      ps "(Lfunction ";
      dump_lam l;
      ps ")"

  | Llet ( [], l ) -> dump_lam l

  | Llet ( ls, l ) -> ps "(Llet ";
		      dump_lams ls;
                      ps " ";
		      dump_lam l;
		      ps ")"

  | Lletrec ( lis, l ) ->
     ps "(Lletrec (";
     do_list 
       (function (lam, i) -> 
         ps "(";
         dump_lam lam;
         ps " (";
         pdummy_size i;
         ps "))")
       lis;
     ps ") ";
     dump_lam l;
     ps ")"

  | Lprim ( p, ls ) ->
	ps "(Lprim ";
	dump_primitive p;
        ps " ";
	dump_lams ls;
	ps ")"

  | Lcond ( l, ls ) ->
	ps "(Lcond ";
	dump_lam l;
        ps " (";
        do_list 
          (function (atom , l) -> 
            ps "(";
            dump_atomic_constant atom;
            ps " ";
            dump_lam l;      
            ps ") ")
          ls;
        ps "))"

  | Lswitch ( i , l , ls ) ->
	ps "(Lswitch ";
	pi i; ps " ";
	dump_lam l;
        ps "(";
        do_list (function (cst, l) -> 
                           ps "(";
                           dump_constr cst;
                           ps " ";
			   dump_lam l;      
                           ps ") ")
                ls;
        ps "))"

  | Lstaticfail ->
	ps "(Lstaticfail)"
  | Lstatichandle ( l1 , l2 ) ->
	ps "(Lstatichandle ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lhandle ( l1 , l2 ) ->
	ps "(Lhandle ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lifthenelse ( l1 , l2 , l3 ) ->
	ps "(Lifthenelse ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps " ";
	dump_lam l3;
	ps ")"
  | Lsequence ( l1 , l2 ) ->
	ps "(Lsequence ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lwhile ( l1 , l2 ) ->
	ps "(Lwhile ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lfor ( l1 , l2 , b , l3) ->
	ps "(Lfor ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps " ";
	if b 
	then ps "#t "
	else ps "#f ";
	dump_lam l3;
	ps ")"
  | Lsequand ( l1 , l2 ) ->
	ps "(Lsequand ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lsequor ( l1 , l2 ) ->
	ps "(Lsequor ";
	dump_lam l1;
	ps " ";
	dump_lam l2;
	ps ")"
  | Lshared ( l , i ) ->
	ps "(Lshared "; 
	dump_lam l;
	ps " ";
	pi !i;
	ps ")"

and dump_lams lams = 
    ps "(";
    do_list (function lam -> dump_lam lam; ps " ") lams;
    ps ")"

and dump_atomic_constant = function
    ACint i -> pi i
  | ACfloat f -> pf f
  | ACstring s -> ps "#"; pc`"`; ps (string_for_C_read s); pc `"`
  | ACchar `\n` -> ps "#\\"; ps "Newline"
  | ACchar `\t` -> ps "#\\"; ps "tab"
  | ACchar c -> ps "#a"; let n = int_of_char c in
                            let s = string_of_int n in
                               if( n < 10 ) then
                                  ( ps "00"; ps s )
                               else
                                  if( n < 100 ) then
                                     ( ps "0"; ps s )
                                  else
                                     ps s

and dump_struct_constant = function 
    SCatom c -> 
        ps "(SCatom ";
        dump_atomic_constant c;
        ps ")"
  | SCblock ( ctag , str_cst_list ) ->
	ps "(SCblock ";
	dump_constr_tag ctag;
	ps " (";
        do_list (function s ->
                  dump_struct_constant s; 
	          ps " ")
                str_cst_list;
        ps "))"

and dump_qualified_ident qi =   ps "(qualifiedident ";
                                pc `"`;
				ps qi.qual; 
                                pc `"`;
				ps " ";
(* Si on veut etre case sensitive, il faut retirer les deux *)
(* commentaires ci-dessous.                                 *)
(* respec. si on veut etre uncase-sensitive, il faut        *)
(* commenter l'ecriture des deux guillemets.                *)
                                pc `"`; 
				ps qi.id;
                                pc `"`;
				ps ")"

and dump_constr_tag = function
    ConstrExtensible ( qi , i ) ->
	ps "(ConstrExtensible ";
	dump_qualified_ident qi;
	ps " ";
	pi i;
	ps ")"
  | ConstrRegular ( qi, i , j ) ->  ps "(ConstrRegular ";
                                    dump_qualified_ident qi; ps " ";
				    pi i; ps " "; pi j;
				    ps ")"
and dump_constr c =
    match c.info.cs_tag with
    ConstrExtensible ( qi , i ) ->
	ps "(ConstrExtensible ";
	dump_qualified_ident qi;
	ps " ";
	pi i;
	ps ")"
  | ConstrRegular ( qi, i , j ) ->
     begin match c.info.cs_kind with
       Constr_constant ->
        ps "(ConstrConstant ";
        dump_qualified_ident qi; ps " ";
        pi i; ps " "; pi j;
        ps ")"
     | _ ->
        ps "(ConstrRegular ";
        dump_qualified_ident qi; ps " "; 
        pi i; ps " "; pi j;
        ps ")" end

and pdummy_size = function
    Dummy_tuple int -> ps "tuple "; pi int
  | Dummy_construct1( c, int ) -> dump_constr c; pi int
  | Dummy_function -> ps "function "
  | Dummy_vector int -> ps "vector "; pi int
  | Dummy_record int -> ps "record "; pi int
  | Dummy_stream -> ps "stream"
  | Dummy_parser -> ps "parser"

and dump_primitive = function
    Pidentity -> ps "Pidentity"
  | Pget_global ( qi ) -> 
	ps "(Pget_global ";
	dump_qualified_ident qi;
	ps ")"
  | Pset_global ( qi ) ->
	ps "(Pset_global ";
	dump_qualified_ident qi;
	ps ")"
  | Pdummy ( dsz ) -> 
	ps "(Pdummy "; pdummy_size dsz; ps ")"
  | Pupdate -> 
	ps "Pupdate"
  | Ptest ( b ) -> 
        ps "(Ptest ";
	dump_bool_test b;
        ps ")"
  | Pmakeblock ( ctag ) ->
        ps "(Pmakeblock ";
	dump_constr_tag ctag;
        ps ")"
  | Ptag_of ->
	ps "Ptag-of"
  | Pfield ( i ) ->
	ps "(Pfield ";
	pi i;
	ps ")"
  | Psetfield ( i ) ->
	ps "(Psetfield ";
	pi i;
	ps ")"
  | Pccall (s , i ) ->
	ps "(Pccall ";
	ps s;
	ps " ";
	pi i;
	ps ")"
  | Praise ->
	ps "Praise"
  | Pnot ->
	ps "Pnot"
  | Pnegint -> ps "Pnegint"
  | Psuccint -> ps "Psuccint" 
  | Ppredint -> ps "Ppredint"
  | Paddint -> ps "Paddint" 
  | Psubint -> ps "Psubint" 
  | Pmulint -> ps "Pmulint" 
  | Pdivint -> ps "Pdivint" 
  | Pmodint -> ps "Pmodint"
  | Pandint -> ps "Pandint" 
  | Porint -> ps "Porint" 
  | Pxorint -> ps "Pxorint"
  | Pshiftleftint -> ps "Pshiftleftint" 
  | Pshiftrightintsigned -> ps "Pshiftrightintsigned" 
  | Pshiftrightintunsigned -> ps "Pshiftrightintunsigned"
  | Pincr -> ps "Pincr" 
  | Pdecr -> ps "Pdecr"
  | Pintoffloat -> ps "Pintoffloat"
  | Pfloatprim p -> ps "(Pfloatprim "; dump_float_primitive p; ps ")"
  | Pstringlength -> ps "Pstringlength" 
  | Pgetstringchar -> ps "Pgetstringchar" 
  | Psetstringchar -> ps "Psetstringchar"
  | Pmakevector -> ps "Pmakevector" 
  | Pvectlength -> ps "Pvectlength" 
  | Pgetvectitem -> ps "Pgetvectitem" 
  | Psetvectitem -> ps "Psetvectitem"

and dump_float_primitive = function
    Pfloatofint -> ps "Pfloatofint"
  | Pnegfloat -> ps "Pnegfloat" 
  | Paddfloat -> ps "Paddfloat" 
  | Psubfloat -> ps "Psubfloat" 
  | Pmulfloat -> ps "Pmulfloat" 
  | Pdivfloat -> ps "Pdivfloat"

and dump_bool_test = function
    Peq_test -> ps "Peq"
  | Pnoteq_test -> ps "Pnoteq_test"
  | Pint_test (PTnoteqimm i) -> ps "(Pint_test (Pnoteqimm "; pi i; ps "))"
  | Pfloat_test (PTnoteqimm i) -> ps "(Pint_test (Pnoteqimm "; pf i; ps "))"
  | Pstring_test (PTnoteqimm i) -> ps "(Pint_test (Pnoteqimm "; ps i; ps "))"
  | Pint_test i -> ps "(Pint_test "; prim_test i; ps ")"
  | Pfloat_test f -> ps "(Pfloat_test "; prim_test f; ps ")"
  | Pstring_test s -> ps "(Pstring_test "; prim_test s; ps ")"
  | Pnoteqtag_test ctag -> dump_constr_tag ctag;;

let dump_lambda outstream rec_flag lam = 
  current_out_stream := outstream;
  if rec_flag then begin ps "(rec "; dump_lam lam; ps ")" end
  else dump_lam lam; 
  pn();;



