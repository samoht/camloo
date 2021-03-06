(* To buffer bytecode during emission *)

#open "obj";;
#open "misc";;
#open "config";;
#open "opcodes";;

let out_buffer = ref (create_string 64)
and out_position = ref 0
;;

let realloc_out_buffer () =
  let new_buffer = create_string (2 * string_length !out_buffer) in
    replace_string new_buffer !out_buffer 0;
    out_buffer := new_buffer;
    ()
;;

let init_out_code () =
  out_position := 0;
  ()
;;

let out b =
  if !out_position >= string_length !out_buffer then realloc_out_buffer();
  set_nth_char !out_buffer !out_position (fchar__char_of_int (b land 255));
  incr out_position
;;

let out_short s =
  out s; out (lshift_right s 8)
;;

let out_long l =
  out l;
  out (lshift_right l 8);
  out (lshift_right l 16);
  out (lshift_right l 24)
;;

