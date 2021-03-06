(* Operation on strings, with sanity checks *)

(**) #open "int";;
(**) #open "exc";;

(*














































typedef char schar;






















   













































*)

let create_string n =
  if n < 0 or n >= 1 lsl 28
  then invalid_arg "create_string"
  else fstring__create_string n
;;

let make_string n c =
  if n < 0 or n >= 1 lsl 28
  then invalid_arg "make_string"
  else fstring__make_string n c
;;

let nth_char s n =
  if n < 0 or n >= string_length s
  then invalid_arg "nth_char"
  else fstring__nth_char s n
;;
let set_nth_char s n c =
  if n < 0 or n >= string_length s
  then invalid_arg "set_nth_char"
  else fstring__set_nth_char s n c
;;
let fill_string s start len c =
  if start < 0 or len < 0 or start+len > string_length s
  then invalid_arg "fill_string"
  else fstring__fill_string s start len c
;;
let blit_string src start_src dst start_dst len =
  if start_src < 0 or start_src + len > string_length src
  or start_dst < 0 or start_dst + len > string_length dst
  or len < 0
  then invalid_arg "blit_string"
  else fstring__blit_string src start_src dst start_dst len
;;
let prefix ^ = fstring__prefix ^
;;
let sub_string s start len =
  if start < 0 or len < 0 or start+len > string_length s
  then invalid_arg "sub_string"
  else fstring__sub_string s start len
;;
let replace_string dest src pos =
  if pos < 0 or pos + string_length src > string_length dest
  then invalid_arg "replace_string"
  else fstring__replace_string dest src pos
;;

let string_for_read = fstring__string_for_read
;;
