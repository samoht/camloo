exception bar;;
exception Foo;;

let f =
	try
		0
	with Foo  -> 1
		| bar -> -1
;;

let _ = try raise Foo with x -> 0;;

(*exception foo;;
exception bar of int;;
exception f;;
exception b of string;;

let x =
	begin
		try
			print_string "x";
			raise f
		with  foo   -> print_string "Foo"
			| bar i -> print_int i
			| f     -> print_string "F"
			| b s   -> print_string s
	end;
	print_newline ()
;;
*)
