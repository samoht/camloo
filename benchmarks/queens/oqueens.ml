(* From "A Compiler for Lazy ML" by L. Augustsson *)
let succ x = x + 1;;

let rec length = function
    [] -> 0
  | _::l -> succ (length l);;

let map f =
  let rec map_rec = function
   [] -> []
 | x::l -> f x :: map_rec l in map_rec;;

let print_list l =
    print_string"(";
    List.iter (fun x -> print_int x; print_string " ") l;
    print_string")"
;;

let print_gen l = l;;
let print_bool b = b (*print_string (if b then "#t" else "#f");b*);;

let rec filter p l = match print_gen l with
 [] -> [] | x::l -> if p x then x :: filter p l else filter p l;;

let rec count _from _to = if _from > _to then []
                                     else (_from :: count (succ _from) _to);;

let rec concmap f = function
	|  [] -> []
	| x :: l -> (f x) @ (concmap f l);;

let nsoln nq =
	let rec safe d x = function
			[] -> true
		| (q::l) -> print_bool ((not (x == q)) & (not (x == q+d)) & (not (x == q-d))
								& safe (d+1) x l)
	in let ok = function
			[] -> true
		| (x::l) -> safe 1 x l
	in let pos_l = count 1 nq in
	let testcol = fun b -> (filter ok (map (fun q -> q::b) pos_l)) in
    let rec gen  = function
			0 -> [[]]
		| n -> concmap testcol (print_gen (gen (n - 1)))
      
	in length (gen nq);;

(* Augustsson's version *)

let nsoln_a nq =
  let rec ok = function
    [] -> true
  | (x::l) -> 
      let rec safe x d = (function
         [] -> true
       | (q::l) -> (not (x == q)) & (not (x == q+d)) & (not (x == q-d))
                   & safe x (d+1) l)
      in safe x 1 l
  in
    let rec gen  = function
       0 -> [[]]
     | n -> concmap (fun b -> (filter ok (map (fun q -> q::b) (count 1 nq))))
                    (gen (n - 1))
   in length (gen nq);;


print_int(nsoln 10);; print_int(nsoln_a 10);;

print_newline();;


