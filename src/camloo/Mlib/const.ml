(* Constants *)

#open "misc";;

type qualified_ident =
  { qual: string;
    id: string }
;;

type constr_tag =
    ConstrExtensible of qualified_ident * int (* name of constructor & stamp *)
  | ConstrRegular of qualified_ident * int * int (* tag number & number of constrs *)
;;

type atomic_constant =
    ACint of int
  | ACfloat of float
  | ACstring of string
  | ACchar of char

and struct_constant =
    SCatom of atomic_constant
  | SCblock of constr_tag * struct_constant list
;;

let const_unit =
    SCblock(ConstrRegular({qual="builtin"; id="()"},0,1), [])
;;

let int_of_atom = function
    ACint i -> i
  | ACchar c -> int_of_char c
  | _ -> fatal_error "int_of_atom"
;;

let int_of_constr_tag = function
    ConstrRegular(_,i,_) -> i
  | ConstrExtensible _ -> fatal_error "int_of_constr_tag"
;;
