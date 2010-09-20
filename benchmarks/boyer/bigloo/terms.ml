(* Manipulations over terms *)

type term =
    Var of int
  | Prop of head * term list
and head =
    { name: string;
      mutable props: (term * term) list };;

let rec print_term = function
    Var v ->
      print_string "v"; print_int v
  | Prop (head,argl) ->
      print_string "(";
      print_string head.name;
      do_list (fun t -> print_string " "; print_term t) argl;
      print_string ")";;
			 
let lemmas = ref ([] : head list);;

(* Replacement for property lists *)

let get name =
	let rec get_rec = function
		  hd1::hdl ->
			  if hd1.name = name then hd1 else get_rec hdl
		| [] ->
			  let entry = {name = name; props = []} in
			  lemmas := entry :: !lemmas;
			  entry
	in get_rec !lemmas;;

let add_lemma (Prop(_, [(Prop(headl,_) as left); right])) =
  headl.props <- (left, right) :: headl.props;;

(* Substitutions *)

type subst = Bind of int * term;;

let get_binding v list =
  let rec get_rec = function
    [] -> failwith "unbound"
  | Bind(w,t)::rest -> if v == w  then t else get_rec rest
  in get_rec list;;

let apply_subst alist =
  let rec as_rec = function
     Var v as term -> begin try get_binding v alist with Failure _ -> term end
   | Prop (head,argl) -> Prop (head, map as_rec argl)
  in as_rec;;

exception Unify;;

let rec unify term1 term2 =
  unify1 term1 term2 []

and unify1 term1 term2 unify_subst =
 match term2 with
    Var v ->
      begin try
        if get_binding v unify_subst = term1
        then unify_subst
        else raise Unify
      with Failure _ ->
        Bind(v,term1) :: unify_subst
      end
  | Prop (head2, argl2) ->
      match term1 with
         Var _ -> raise Unify
       | Prop (head1,argl1) ->
           if head1 == head2
           then unify1_lst argl1 argl2 unify_subst
           else raise Unify

and unify1_lst = fun
    [] [] unify_subst -> unify_subst
  | (h1::r1) (h2::r2) unify_subst ->
      unify1_lst r1 r2 (unify1 h1 h2 unify_subst)
  | _ _ _ -> raise Unify;;

let rec rewrite x =
	match x with
	  Var _ as term -> term
	| Prop (head, argl) ->
		rewrite_with_lemmas (Prop (head, map rewrite argl)) head.props
and rewrite_with_lemmas term x =
	match x with
	  [] -> term
	| (t1,t2)::rest ->
			  try
				  rewrite (apply_subst (unify term t1) t2)
			  with Unify ->
				  rewrite_with_lemmas term rest;;

