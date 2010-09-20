#open "hop";;

define_service "hello/world" (fun _ -> html [ body [ "hello world" ] ])
;;

(*let say_hello =
	html [ body [ a "hello/world" "Click me!" ] ]
;;

define servie "hello" (fun _ -> say_hello)
;;
*)
