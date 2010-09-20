(* The type of primitives *)
(*
#open "const";;

type dummy_size = 
     Dummy_tuple of int
   | Dummy_construct1 of constr_desc global * int
   | Dummy_function
   | Dummy_vector of int
   | Dummy_record of int
   | Dummy_stream
   | Dummy_parser
;;

type primitive =
    Pidentity
  | Pget_global of qualified_ident
  | Pset_global of qualified_ident
  | Pdummy of dummy_size
  | Pupdate
  | Ptest of bool_test
  | Pmakeblock of constr_tag
  | Ptag_of
  | Pfield of int
  | Psetfield of int
  | Pccall of string * int
  | Praise
  | Pnot
  | Pnegint | Psuccint | Ppredint
  | Paddint | Psubint | Pmulint | Pdivint | Pmodint
  | Pandint | Porint | Pxorint
  | Pshiftleftint | Pshiftrightintsigned | Pshiftrightintunsigned
  | Pincr | Pdecr
  | Pintoffloat
  | Pfloatprim of float_primitive
  | Pstringlength | Pgetstringchar | Psetstringchar
  | Pmakevector | Pvectlength | Pgetvectitem | Psetvectitem

and float_primitive =
    Pfloatofint
  | Pnegfloat | Paddfloat | Psubfloat | Pmulfloat | Pdivfloat

and bool_test =
    Peq_test
  | Pnoteq_test
  | Pint_test of int prim_test
  | Pfloat_test of float prim_test
  | Pstring_test of string prim_test
  | Pnoteqtag_test of constr_tag

and 'a prim_test =
    PTeq
  | PTnoteq
  | PTnoteqimm of 'a
  | PTlt
  | PTle
  | PTgt
  | PTge
;;
*)
