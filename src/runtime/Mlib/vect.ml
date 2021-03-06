(* Operations on vectors, with sanity checks *)

(**) #open "int";;
(**) #open "exc";;

(*














































typedef char schar;






















   













































*)
 
let make_vect n init =
  if n < 0 or n >= 0x400000
  then invalid_arg "make_vect"
  else fvect__make_vect n init
;;
let make_matrix dimx dimy init =
  if dimx < 0 or dimx >= 0x400000
  or dimy < 0 or dimy >= 0x400000
  then invalid_arg "make_matrix"
  else fvect__make_matrix dimx dimy init
;;
let vect_item v i =
  if i < 0 or i >= vect_length v
  then invalid_arg "vect_item"
  else fvect__vect_item v i
;;
let vect_assign v i e =
  if i < 0 or i >= vect_length v
  then invalid_arg "vect_assign"
  else fvect__vect_assign v i e
;;
let fill_vect v start len init =
  if start < 0 or len < 0 or start + len > vect_length v
  then invalid_arg "fill_vect"
  else fvect__fill_vect v start len init
;;
let blit_vect src start_src dst start_dst len =
  if start_src < 0 or start_src + len > vect_length src
  or start_dst < 0 or start_dst + len > vect_length dst
  or len < 0
  then invalid_arg "blit_vect"
  else fvect__blit_vect src start_src dst start_dst len
;;
let concat_vect = fvect__concat_vect
;;
let sub_vect v start len =
  if start < 0 or len < 0 or start + len > vect_length v
  then invalid_arg "sub_vect"
  else fvect__sub_vect v start len
;;
let copy_vect = fvect__copy_vect
;;
let list_of_vect = fvect__list_of_vect
and vect_of_list = fvect__vect_of_list
;;
let do_vect = fvect__do_vect
and map_vect = fvect__map_vect
and map_vect_list = fvect__map_vect_list
;;
