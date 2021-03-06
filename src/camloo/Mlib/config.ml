(* Configuration file *)


let path_library = ref "";;


(* Integer ranges *)

let maxint_byte = 255
and minint_byte = 0
and maxint_short = 32767
and minint_short = (-32768)
;;

(* The standard interfaces used by default. *)

let default_used_interfaces =
  ["cautious", ["io"; "eq"; "int"; "float"; "ref"; "pair"; "list";
                "vect"; "char"; "string"; "bool"; "exc"; "stream"; "builtin"];
   "fast",     ["io"; "eq"; "int"; "float"; "ref"; "pair"; "list";
                "fvect"; "fchar"; "fstring"; "bool";
                "exc"; "stream"; "builtin"];
   "none",     ["builtin"]]
;;

(* The default name for executable bytecode files. *)


let default_exec_name = "a.out";;




(* Prompts.
 * toplevel_input_prompt: Printed before user input.
 * toplevel_output_prompt: Printed before compiler ouput in the toplevel syst.
 * toplevel_error_prompt: Printed before compiler error and warning messages.
 * batch_output_prompt: Printed before compiler output in the batch system.
 * batch_error_prompt: Printed before error and warning messages.
 *)

let toplevel_input_prompt = "#";;
let toplevel_output_prompt = "";;
let toplevel_error_prompt = ">";;
let batch_output_prompt = "";;
let batch_error_prompt = "#";;

