(* A catch-all exception handler *)

#open "exc";;
#open "eq";;
#open "int";;
#open "fvect";;
#open "io";;
#open "obj";;
#open "sys";;

type qualid = {qual:string; id:string}
;;

let f fct arg =
  try
    fct arg
  with x ->
    flush std_out;
    begin match x with
      Out_of_memory ->
        prerr_string "Out of memory"
    | Match_failure(file, first_char, last_char) ->
        prerr_string "Pattern matching failed, file ";
        prerr_string file;
        prerr_string ", chars "; prerr_int first_char;
        prerr_string "-"; prerr_int last_char
    | Failure s ->
        prerr_string "Evaluation failed : "; prerr_string s
    | Invalid_argument s ->
        prerr_string "Invalid argument : "; prerr_string s
    | Sys_error msg ->
        prerr_string "System call failed : ";
        prerr_string msg
    | x ->
        prerr_string "Uncaught exception ";
        prerr_string (string_of_exception (repr x))
    end;
    prerr_char `\n`;
    io__exit 2
;;
