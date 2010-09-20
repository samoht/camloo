(* filename.mlp *)

(**) #open "int";;
(**) #open "eq";;
(**) #open "fstring";;
(**) #open "exc";;

let check_suffix name suff =
 string_length name >= string_length suff &
 sub_string name (string_length name - string_length suff) (string_length suff)
    = suff
;;

let chop_suffix name suff =
  sub_string name 0 (string_length name - string_length suff)
;;


let current_dir_name = ".";;

let concat dirname filename =
  let l = string_length dirname - 1 in
  if l < 0 or nth_char dirname l == `/`
  then dirname ^ filename
  else dirname ^ "/" ^ filename
;;

let is_absolute n =
     (string_length n >= 1 & sub_string n 0 1 = "/")
  or (string_length n >= 2 & sub_string n 0 2 = "./")
  or (string_length n >= 3 & sub_string n 0 3 = "../")
;;

let slash_pos s =
  let rec pos i =
    if i < 0 then raise Not_found
    else if nth_char s i == `/` then i
    else pos (i - 1)
  in pos (string_length s - 1)
;;

let basename name =
  try
    let p = slash_pos name + 1 in
      sub_string name p (string_length name - p)
  with Not_found ->
    name
;;

let dirname name =
  if name = "/" then name else
    try
      sub_string name 0 (slash_pos name)
    with Not_found ->
      "."
;;





