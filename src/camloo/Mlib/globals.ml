(* Global symbol tables *)

#open "const";;

(* A reference to a global, in a source file, is either a qualified identifier
   mod__name, or an unqualified identifier name. *)

type global_reference =
    GRname of string
  | GRmodname of qualified_ident
;;

(* Internally, a global is represented by its fully qualified name,
   plus associated information. *)

type 'a global =
  { qualid: qualified_ident; (* Full name *)
    info: 'a }               (* Description *)
;;

let little_name_of_global g = g.qualid.id
;;

(* Type constructors *)

type type_constr =
  { mutable ty_stamp: int;              (* Stamp *)
    mutable ty_dang: bool;              (* Dangerous or not *)
    mutable ty_abbr: type_abbrev }      (* Abbreviation or not *)

and type_abbrev =
    Tnotabbrev
  | Tabbrev of typ list * typ           (* Parameters and body *)

(* Type expressions *)

and typ =
  { typ_desc: typ_desc;                 (* What kind of type expression? *)
    mutable typ_level: int }            (* Binding level *)
and typ_desc =
    Tvar of mutable typ_link            (* A type variable *)
  | Tarrow of typ * typ                 (* A function type *)
  | Tproduct of typ list                (* A tuple type *)
  | Tconstr of type_constr global * typ list  (* A constructed type *)
and typ_link =
    Tnolink                             (* Free variable *)
  | Tlinkto of typ                      (* Instantiated variable *)
;;

(* Type constructor descriptions *)

type type_desc =
  { ty_constr: type_constr global;      (* The constructor *)
    ty_arity: int;                      (* Its arity *)
    mutable ty_desc: type_components }  (* Its description *)

and type_components =
    Abstract_type
  | Variant_type of constr_desc global list (* Sum type -> list of constr. *)
  | Record_type of label_desc global list (* Record type -> list of labels *)
  | Abbrev_type of typ list * typ         (* Abbreviation *)

(* Value constructors *)

and constr_desc =
  { cs_res: typ;                       (* Result type *)
    cs_arg: typ;                       (* Argument type *)
    cs_mut: mutable_flag;              (* Mutable or not *)
    cs_tag: constr_tag;                (* Its run-time tag *)
    cs_kind: constr_kind }             (* How it is represented *)

and mutable_flag =
  Mutable | Notmutable

and constr_kind =
    Constr_constant                     (* Constant constructor *)
  | Constr_regular                      (* Usual constructor *)
  | Constr_superfluous of int           (* Superfluous constructor
                                           with its arity *)

(* Labels *)

and label_desc =
  { lbl_res: typ;                      (* Result type *)
    lbl_arg: typ;                      (* Argument type *)
    lbl_mut: mutable_flag;             (* Mutable or not *)
    lbl_pos: int }                     (* Position in the tuple *)
;;

let generic = (-1)
and notgeneric = 0;;

(* Inclusion du fichier `prim.ml' *)
(* The type of primitives *)

(* #open "const";; *)

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


(* Global variables *)

type value_desc =
  { val_typ: typ;                       (* Type *)
    val_prim: prim_desc }               (* Is this a primitive? *)

and foreign_desc =
    Regprim                             (* Regular primitive *)
  | Schemeprim of string * string       (* Scheme module & file *)

and prim_desc =
    ValueNotPrim
  | ValuePrim of foreign_desc * int * primitive (* arity & implementation *)
;;

