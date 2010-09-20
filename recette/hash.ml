type t = MC of string | Ident of string
;;

let l = [ "a"; "bb"; "ccc" ]
;;

let p m x =
	print_string m;
	print_string ": ";
	(match x with
		MC k -> 
			print_string "MC ";
			print_string k
		| Ident k ->
			print_string "Ident ";
			print_string k);
	print_newline ()
;;

let f () =
	let h = hashtbl__new 17 in
	do_list (function m ->
				 print_string "Adding ";
				 print_string m;
				 print_newline ();
				 hashtbl__add h m (MC m)) l;
	hashtbl__do_table p h
;;

f ()
;;
