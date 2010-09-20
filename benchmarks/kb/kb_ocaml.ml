(******* Quelques definitions du prelude CAML **************)

let length l = 
  let rec j k = function [] -> k | a::x -> j (k+1) x in
  j 0 l;;

let rec (@) = function l1 -> function l2 -> 
    match l1 with [] -> l2
  | a::r -> a :: (@) r l2;;

let rev l =
  let rec f h = function 
      [] -> h
    | a :: r -> f (a::h) r in
  f [] l;;

exception Failure of string;;

let failwith s = raise (Failure s);;

(* 1- les paires *)

let fst (x,y) = x
and snd (x,y) = y;;

let do_list f l =
  let rec do_rec = function [] -> ()
                          | (a::_L) -> (f a; do_rec _L) in
  do_rec l;;

let map f l =
  let rec map_rec = function
      [] -> []
    | a::_L -> f a :: map_rec _L in
  map_rec l;;

let it_list f l =
  let rec it_rec a = function
     [] -> a
   | b::_L -> it_rec (f a b) _L
  in it_rec l;;

let it_list2 f =
  let rec it_rec a x y = match (x, y) with
    [], [] -> a
  | (a1::_L1), (a2::_L2) -> it_rec (f a a1 a2) _L1 _L2
  | _, _ -> failwith "it_list2" in
  it_rec;;

let exists p =
	let rec exists_p = function
		| [] -> false | a::_L -> p a or exists_p _L in
	exists_p
;;

let for_all p =
	let rec for_all_p = function
		| [] -> true | a::_L -> p a & for_all_p _L in
	for_all_p;;

let rec rev_append x y = match (x, y) with
	| [], l' -> l'
	| (a::l), l' -> rev_append l (a::l');;

let try_find f l =
  let rec try_find_rec = function
      [] -> failwith "try_find"
    | (a::_L) -> try f a with Failure _ -> try_find_rec _L
  in try_find_rec l;;

let partition p l =
  let rec part_rec = function 
      [] -> ([],[])
    | (a::_L) ->
        let (pos,neg) = part_rec _L in
        if p a then ((a::pos), neg) else (pos, (a::neg))
  in part_rec l;;

(* 3- Les ensembles et les listes d'association *)

let mem x l =
 let rec mem_rec = function
     [] -> false | y::l -> x == y or mem_rec l in
 mem_rec l;;

let union _L1 _L2 =
  let rec union_rec = function
      [] -> _L2
    | (a::_L) -> if mem a _L2 then union_rec _L else a :: union_rec _L
  in union_rec _L1;;

let mem_assoc a =
  let rec mem_rec = function
      [] -> false
    | (b,_)::l -> a == b or mem_rec l in
  mem_rec;;

let assoc a =
  let rec assoc_rec = function
      [] -> failwith "find"
    | (b,d)::l -> if a == b then d else assoc_rec l
  in assoc_rec;;

(* 4- Les sorties *)

let print_num = print_int;;

let message s = print_string s; print_newline ();;

(* 5- Les ensembles *)

(*
let union L1 =
  let rec union_rec = function
      [] -> L1
    | (a::L) -> if mem a L1 then union_rec L else a :: union_rec L
  in union_rec;;
*)
(****************** Term manipulations *****************)

type term =
     Var of int
   | Term of char * term list;;

let rec vars = function 
    Var n -> [n]
  | Term(_,_L) -> vars_of_list _L
and vars_of_list = function
    [] -> []
  | (t::r) -> union (vars t) (vars_of_list r);;

let substitute subst =
  let rec subst_rec = function
      Term(oper,sons) -> Term(oper, map subst_rec sons)
    | Var n as t -> try (assoc n subst) with Failure _ -> t
  in subst_rec;;

let change f =
  let rec change_rec n = function
      h::t -> if n==1 then f h :: t else h :: change_rec (n-1) t
    |  _ -> failwith "change"
  in change_rec;;

(* Term replacement replace M u N => M[u<-N] *)
let replace _M u _N = 
  let rec reprec t = function
      [] -> _N
    | (n::u) -> 
       match t with 
         Term(oper,sons) ->
           Term(oper, change (fun _P -> reprec _P u) n sons)
        | _ -> failwith "replace"
  in reprec _M u;;

(* matching = - : (term -> term -> subst) *)
let matching term1 term2 =
  let rec match_rec subst _M = function
      Var v ->
        if mem_assoc v subst then
        if _M = assoc v subst then subst else failwith "matching"
        else (v,_M) :: subst
    | Term(op1,sons1) ->
        match _M with
          Term(op2,sons2) ->
	   if op1 == op2 then
              it_list2 match_rec subst sons2 sons1
           else failwith "matching"
        | _ -> failwith "matching"
  in match_rec [] term2 term1;;

(*
let matching term1 term2 =
  let rec match_rec subst = function
      Var v, M ->
        if mem_assoc v subst then
        if M = assoc v subst then subst else failwith "matching"
        else (v,M) :: subst
    | Term(op1,sons1), Term(op2,sons2)  ->
        if op1 = op2 then it_list2 match_rec subst sons1 sons2
           else failwith "matching"
    | _ -> failwith "matching"
  in match_rec [] (term1, term2);;
*)
(* A naive unification algorithm *)

let compsubst subst1 subst2 = 
  (map (fun (v,t) -> (v, substitute subst1 t)) subst2) @ subst1;;

let occurs n =
  let rec occur_rec = function
      Var m -> m==n
    | Term(_,sons) -> exists occur_rec sons in
  occur_rec;;

let rec unify term1 term2 =
    match term1 with
    Var n1 ->
      if term1 = term2 then []
      else if occurs n1 term2 then failwith "unify"
      else [(n1,term2)]
  | Term(op1,sons1) ->
    match term2 with
     Var n2 ->
      if occurs n2 term1 then failwith "unify"
      else [(n2,term1)]
   | Term(op2,sons2) ->
      if op1 == op2 then 
         it_list2
          (fun s t1 t2 ->
             compsubst
              (unify(substitute s t1)
                    (substitute s t2)) s)
          [] sons1 sons2
      else failwith "unify";;

(* We need to print terms with variables independently from input terms
  obtained by parsing. We give arbitrary names v1,v2,... to their variables. *)

let _INFIXES = ['+'; '*'];;

let rec pretty_term = function
    Var n -> print_string "v"; print_num n
  | Term (oper,sons) ->
      if mem oper _INFIXES then
        match sons with
            [s1; s2] ->
              pretty_close s1; print_char oper; pretty_close s2
          | _ ->
              failwith "pretty_term : infix arity <> 2"
      else begin
        print_char oper;
        match sons with
          []   -> ()
        | t::lt ->
           print_char '(';
           pretty_term t;
           do_list (fun t -> print_char ','; pretty_term t) lt;
           print_char ')'
      end
and pretty_close = function
    Term(oper, _) as _M ->
      if mem oper _INFIXES then
        begin print_char '('; pretty_term _M; print_char ')' end
      else pretty_term _M
  | _M -> pretty_term _M;;

(****************** Equation manipulations *************)

(* standardizes an equation so its variables are 1,2,... *)

let mk_rule _M _N =
  let all_vars = union (vars _M) (vars _N) in
  let (k,subst) =
      it_list (fun (i,sigma) v -> (i+1, (v, Var(i))::sigma))
              (1,[]) all_vars
  in (k-1, (substitute subst _M, substitute subst _N));;

(* checks that rules are numbered in sequence and returns their number *)
let check_rules =
  it_list (fun n (k,_) ->
            if k==n+1 then k
            else failwith "Rule numbers not in sequence") 0;;

let pretty_rule (k,(n,(_M,_N))) =
    print_num k; print_string " : ";
    pretty_term _M; print_string " = "; pretty_term _N;
    print_newline();;

let pretty_rules = do_list pretty_rule;;


(****************** Rewriting **************************)

(* Top-level rewriting. Let eq:L=R be an equation, M be a term such that L<=M.
   With sigma = matching L M, we define the image of M by eq as sigma(R) *)
let reduce _L _M = substitute (matching _L _M);;

(* A more efficient version of can (rewrite1 (L,R)) for R arbitrary *)
let reducible _L =
  let rec redrec _M =
      try matching _L _M; true with
       Failure _ ->
        match _M with Term(_,sons) -> exists redrec sons
                   | _ -> false
  in redrec;;

(* mreduce : rules -> term -> term *)
let mreduce rules _M =
  let redex (_,(_,(_L,_R))) = reduce _L _M _R in try_find redex rules;;

(* One step of rewriting in leftmost-outermost strategy, with multiple rules *)
(* fails if no redex is found *)
(* mrewrite1 : rules -> term -> term *)
let mrewrite1 rules =
  let rec rewrec _M =
    try mreduce rules _M with
    Failure _ ->
     let rec tryrec = function
         [] -> failwith "mrewrite1"
       | son::rest ->
           try rewrec son :: rest with Failure _ -> son :: tryrec rest in
    match _M with
      Term(f, sons) -> Term(f, tryrec sons)
    | _ -> failwith "mrewrite1"
  in rewrec;;

(* Iterating rewrite1. Returns a normal form. May loop forever *)
(* mrewrite_all : rules -> term -> term *)
let mrewrite_all rules _M =
  let rec rew_loop _M =
    try rew_loop(mrewrite1 rules _M) with Failure _ -> _M in
  rew_loop _M;;

(*
pretty_term (mrewrite_all Group_rules M where M,_=<<A*(I(B)*B)>>);;
=-> A*U
*)

(************************ Recursive Path Ordering ****************************)

type ordering = Greater | Equal | NotGE;;

let ge_ord order x y = match order x y with NotGE -> false | _ -> true
and gt_ord order x y = match order x y with Greater -> true | _ -> false
and eq_ord order x y = match order x y with Equal -> true | _ -> false;;

let rem_eq equiv =
    let rec remrec x = function
        [] -> failwith "rem_eq"
      | y::l -> if equiv x y then l else y :: remrec x l
  in remrec;;

let diff_eq equiv x y =
  let rec diffrec y = function
       [] -> [],y
     | (h::t) ->
         try diffrec (rem_eq equiv h y) t with
         Failure _ ->
          let (x',y') = diffrec y t in (h::x',y')
  in if length x > length y then diffrec x y else diffrec y x;;

(* multiset extension of order *)
let mult_ext order = function
    (Term(_,sons1), Term(_,sons2)) ->
      (match diff_eq (eq_ord order) sons1 sons2 with
           ([],[]) -> Equal
         | (l1,l2) ->
             if for_all (fun _N -> exists (fun _M -> order _M _N = Greater) l1) l2
             then Greater else NotGE)
  | (_, _) -> failwith "mult_ext";;

(* lexicographic extension of order *)
let lex_ext order _M _N =
    match _M with
     Term(_,sons1) as _M ->
      begin match _N with
       Term(_,sons2) as _N ->
         let rec lexrec x y = match (x, y) with
             [], [] -> Equal
           | [], _ -> NotGE
           | _, [] -> Greater
           | (x1::l1), (x2::l2) ->
               begin
                 match order x1 x2 with
                   Greater -> if for_all (fun _N' -> gt_ord order _M _N') l2 
                              then Greater else NotGE
                 | Equal -> lexrec l1 l2
                 | NotGE -> if exists (fun _M' -> ge_ord order _M' _N) l1 
                            then Greater else NotGE
               end
         in lexrec sons1 sons2
      | _ -> failwith "lex_ext" end
  | _ -> failwith "lex_ext";;

(* recursive path ordering *)

let rpo op_order ext =
  let rec rporec _M _N =
    if _M=_N then Equal else 
      match _M with
          Var m -> NotGE
        | Term(op1,sons1) ->
            match _N with
                Var n ->
                  if occurs n _M then Greater else NotGE
              | Term(op2,sons2) ->
                  match (op_order op1 op2) with
                      Greater ->
                        if for_all (fun _N' -> gt_ord rporec _M _N') sons2
                        then Greater else NotGE
                    | Equal ->
                        ext rporec _M _N
                    | NotGE ->
                        if exists (fun _M' -> ge_ord rporec _M' _N) sons1
                        then Greater else NotGE
  in rporec;;

(****************** Critical pairs *********************)

(* All (u,sig) such that N/u (&var) unifies with M,
   with principal unifier sig *)

let super _M =
  let rec suprec = function
      Term(_,sons) as _N ->
        let rec collate (pairs,n) son =
            (pairs @ map (fun (u,sigma) -> (n::u,sigma)) (suprec son), n+1) in
        let insides = fst (it_list collate ([],1) sons)
        in (try ([], unify _M _N) :: insides with Failure _ -> insides)
    | _ -> []
  in suprec;;

(* Ex :
let (M,_) = <<F(A,B)>> 
and (N,_) = <<H(F(A,x),F(x,y))>> in super M N;;
=-> [[1],[2,Term ("B",[])];                      x <- B
     [2],[2,Term ("A",[]); 1,Term ("B",[])]]     x <- A  y <- B
*)

(* All (u,sigma), u&[], such that N/u unifies with M *)
(* super_strict : term -> term -> (num list & subst) list *)

let super_strict _M = function
    Term(_,sons) ->
      let collate (pairs,n) son =
          (pairs @ map (fun (u,sigma) -> (n::u,sigma)) (super _M son), n+1)
      in fst (it_list collate ([],1) sons)
  | _ -> [];;

(* Critical pairs of L1=R1 with L2=R2 *)
(* critical_pairs : term_pair -> term_pair -> term_pair list *)
let critical_pairs (_L1,_R1) (_L2,_R2) =
    let mk_pair (u,sigma) =
        (substitute sigma (replace _L2 u _R1), substitute sigma _R2) in
    map mk_pair (super _L1 _L2);;

(* Strict critical pairs of L1=R1 with L2=R2 *)
(* strict_critical_pairs : term_pair -> term_pair -> term_pair list *)
let strict_critical_pairs (_L1,_R1) (_L2,_R2) =
    let mk_pair (u,sigma) =
        (substitute sigma (replace _L2 u _R1), substitute sigma _R2) in
  map mk_pair (super_strict _L1 _L2);;

(* All critical pairs of eq1 with eq2 *)
let mutual_critical_pairs eq1 eq2 =
    (strict_critical_pairs eq1 eq2) @ (critical_pairs eq2 eq1);;

(* Renaming of variables *)

let rename n (t1,t2) =
  let rec ren_rec = function
      Var k -> Var(k+n)
    | Term(oper,sons) -> Term(oper, map ren_rec sons)
  in (ren_rec t1, ren_rec t2);;

(************************ Completion ******************************)

let deletion_message (k,_) =
    print_string "Rule "; print_num k; message " deleted";;

(* Generate failure message *)
let non_orientable (_M, _N) =
    pretty_term _M; print_string " = "; pretty_term _N; print_newline();;

(* Improved Knuth-Bendix completion procedure *)
(* kb_completion : (term_pair -> bool) -> num -> rules -> term_pair list -> (num & num) -> term_pair list -> rules *)
let kb_completion greater =
  let rec kbrec n rules =
   let rec normal_form t = mrewrite_all rules t
   and get_rule k = assoc k rules
   and process failures =
       let rec processf k l =
           let rec processkl = function
               [] ->
                if k<l then next_criticals (k+1) l else
                if l<n then next_criticals 1 (l+1) else
                 (match failures with
                    [] -> rules (* successful completion *)
                  | _  -> (message "Non-orientable equations :";
                           do_list non_orientable failures;
                           failwith "kb_completion"))
             | ((_M,_N)::eqs) ->
               let _M' = normal_form _M
               and _N' = normal_form _N in
               let enter_rule str left right =
                   let new_rule = (n+1, mk_rule left right) in
                   (pretty_rule new_rule;
                    let left_reducible (_,(_,(_L,_))) = reducible left _L in
                    let (redl,irredl) = partition left_reducible rules
                    in (do_list deletion_message redl;
                        let right_reduce (m,(_,(_L,_R))) = 
                            (m,mk_rule _L (mrewrite_all (new_rule::rules) _R)) in
                        let irreds = map right_reduce irredl
                        and eqs' = map (fun (_,(_,pair)) -> pair) redl
                        in kbrec (n+1) (new_rule::irreds) [] k l
                                       (eqs @ eqs' @ failures)
                       )
                   )
              in if _M'=_N' then processkl eqs else
                 if greater _M' _N' then enter_rule "a"  _M' _N' else
                 if greater _N' _M' then enter_rule "b" _N' _M' else
                   process ((_M',_N')::failures) k l eqs

            in processkl

          and next_criticals k l =
            try 
             let (v,el) = get_rule l in
(*print_string "next_criticals"; print_newline();*)
             if k==l then
                processf k l (strict_critical_pairs el (rename v el))
             else
              try let (_,ek) = get_rule k in 
                  processf k l (mutual_critical_pairs el (rename v ek))
              with Failure "find" (*rule k deleted*) -> next_criticals (k+1) l
            with Failure "find" (*rule l deleted*) -> next_criticals 1 (l+1)
          in processf
    in process
  in kbrec;;

let kb_complete greater complete_rules rules =
    let n = check_rules complete_rules in
    let eqs = map (fun (_,(_,pair)) -> pair) rules in
    let completed_rules =
        kb_completion greater n complete_rules [] n n eqs
    in (message "Canonical set found :";
        pretty_rules (rev completed_rules);
        ());;

let _Group_rules = [
  (1, (1, (Term('*', [Term('U',[]); Var 1]), Var 1)));
  (2, (1, (Term('*', [Term('I',[Var 1]); Var 1]), Term('U',[]))));
  (3, (3, (Term('*', [Term('*', [Var 1; Var 2]); Var 3]),
           Term('*', [Var 1; Term('*', [Var 2; Var 3])]))))];;

let group_precedence op1 op2 =
  if op1 == op2 then Equal else
  if (op1 == 'I') or (op2 = 'U') then Greater else NotGE;;

let group_order = rpo group_precedence lex_ext;;

let _Geom_rules = [
 (1,(1,(Term ('*',[(Term ('U',[])); (Var 1)]),(Var 1))));
 (2,(1,(Term ('*',[(Term ('I',[(Var 1)])); (Var 1)]),(Term ('U',[])))));
 (3,(3,(Term ('*',[(Term ('*',[(Var 1); (Var 2)])); (Var 3)]),
  (Term ('*',[(Var 1); (Term ('*',[(Var 2); (Var 3)]))])))));
 (4,(0,(Term ('*',[(Term ('A',[])); (Term ('B',[]))]),
  (Term ('*',[(Term ('B',[])); (Term ('A',[]))])))));
 (5,(0,(Term ('*',[(Term ('C',[])); (Term ('C',[]))]), (Term ('U',[])))));
 (6,(0,
  (Term
   ('*',
    [(Term ('C',[]));
     (Term ('*',[(Term ('A',[])); (Term ('I',[(Term ('C',[]))]))]))]),
  (Term ('I',[(Term ('A',[]))])))));
 (7,(0,
  (Term
   ('*',
    [(Term ('C',[]));
     (Term ('*',[(Term ('B',[])); (Term ('I',[(Term ('C',[]))]))]))]),
  (Term ('B',[])))))
];;

let _Geom_rank = function
    'U' -> 0
  | '*' -> 1
  | 'I' -> 2
  | 'B' -> 3
  | 'C' -> 4
  | 'A' -> 5
  |  _  -> failwith "Geom_rank";;

let _Geom_precedence op1 op2 =
  let r1 = _Geom_rank op1
  and r2 = _Geom_rank op2 in
  if r1 == r2 then Equal else
  if r1 > r2 then Greater else NotGE;;

let _Geom_order = rpo _Geom_precedence lex_ext;;

(*
let greater x y =
    match Group_order x y with Greater -> true | _ -> false;;
*)
let doit0 () = kb_complete (gt_ord group_order) [] _Group_rules;;

let doit() = kb_complete (gt_ord _Geom_order) [] _Geom_rules;;

(*let doit2() =  kb_complete greater [] Geom_rules;;*)

doit();;
