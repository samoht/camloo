#open "reverse";;

let l = [1; 2; 3; 4];;

let rec print_list = function
    [] -> ()
  | x :: l -> print_int x; print_string " "; print_list l;;

print_string "in ML: l is: [ "; print_list l; print_string "]"; 
print_newline();;
print_string "in ML: l reversed is: [ "; print_list (nreverse l);
print_string "]"; print_newline();;

