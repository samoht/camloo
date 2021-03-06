(*  match.ml : expansion of pattern-matching as a cascade of tests. *)

#open "misc";;
#open "const";;
#open "globals";;
#open "syntax";;
#open "location";;
#open "lambda";;
#open "prim";;
#open "instruct";;

(*  See Peyton-Jones, The Implementation of functional programming
    languages, chapter 5. *)

(* A pattern-matching is represented as a disjunction of conjunctions:

      pat & pat & ... & pat  ->  action
    | pat & pat & ... & pat  ->  action
    | ...
    | pat & pat & ... & pat  ->  action

      exp   exp   ...   exp

  A pattern "pat" applies to (i.e. must match) the expression below it. *)

type pattern_matching =
  Matching of (pattern list * lambda) list * lambda list
;;

(* Simple pattern manipulations *)

let make_path n (path::pathl) =
  let rec make i =
    if i >= n then pathl else Lprim(Pfield i, [path]) :: make (i+1)
  in
    make 0
;;

let add_to_match (Matching(casel,pathl)) cas =
  Matching(cas :: casel, pathl)

and make_constant_match = fun
    (path :: pathl) cas -> Matching([cas], pathl)
  | _ _ -> fatal_error "make_constant_match"

and make_tuple_match arity pathl =
  Matching([], make_path arity pathl)

and make_construct_match cstr (path :: pathl as pathl0) cas =
  match cstr.info.cs_kind with
    Constr_constant ->
      Matching([cas], pathl)
  | Constr_superfluous n ->
      Matching([cas], pathl0)
  | _ ->
      Matching([cas], Lprim(Pfield 0, [path]) :: pathl)
;;

(* Auxiliaries for factoring common tests *)

let add_to_division make_match divlist key cas =
  try
    let matchref = assoc key divlist in
      matchref := add_to_match !matchref cas; divlist
    with Not_found ->
      (key, ref (make_match cas)) :: divlist
;;

(* To skip type constraints and aliases, and flatten "or" patterns. *)

let rec simpl_casel = function
    (Pat(Zaliaspat(pat,v),_) :: patl, action) :: rest ->
      simpl_casel ((pat::patl, action) :: rest)
  | (Pat(Zconstraintpat(pat,ty),_) :: patl, action) :: rest ->
      simpl_casel ((pat::patl, action) :: rest)
  | (Pat(Zorpat(pat1, pat2),_) :: patl, action) :: rest ->
      simpl_casel ((pat1::patl, action) :: (pat2::patl, action) :: rest)
  | casel ->
      casel
;;

(* Factoring pattern-matchings. *)

let divide_constant_matching (Matching(casel, pathl)) =
  divide_rec casel where rec divide_rec casel =
    match simpl_casel casel with
      (Pat(Zconstantpat(cst),_) :: patl, action) :: rest ->
        let (constant, others) = divide_rec rest in
          add_to_division
            (make_constant_match pathl) constant cst (patl, action),
          others
    | casel ->
        [], Matching(casel, pathl)
;;

let divide_tuple_matching arity (Matching(casel, pathl)) =
  divide_rec casel where rec divide_rec casel =
    match simpl_casel casel with
      (Pat(Ztuplepat(args), _) :: patl, action) :: rest ->
        add_to_match (divide_rec rest) (args @ patl, action)
    | (Pat((Zwildpat | Zvarpat _), _) :: patl, action) :: rest ->
        let rec make_pats i =
          if i >= arity
          then []
          else Pat(Zwildpat, no_location) :: make_pats (i+1) in
        add_to_match (divide_rec rest) (make_pats 0 @ patl, action)
    | [] ->
        make_tuple_match arity pathl
    | _ ->
        fatal_error "divide_tuple_matching"
;;

let divide_construct_matching (Matching(casel, pathl)) =
  divide_rec casel where rec divide_rec casel =
    match simpl_casel casel with
      (Pat(Zconstruct0pat(c), _) :: patl, action) :: rest ->
        let (constrs, others) =
          divide_rec rest in
        add_to_division
          (make_construct_match c pathl) constrs c (patl, action),
        others
    | (Pat(Zconstruct1pat(c,arg),_) :: patl, action) :: rest ->
        let patl' =
          match c.info.cs_kind with
            Constr_constant -> patl
          |          _      -> arg :: patl in
        let (constrs, others) =
          divide_rec rest in
        add_to_division
          (make_construct_match c pathl) constrs c (patl', action),
        others
    | casel ->
        [], Matching(casel, pathl)
;;

let divide_var_matching (Matching(casel, (_ :: endpathl as pathl))) =
  divide_rec casel where rec divide_rec casel =
    match simpl_casel casel with
      (Pat((Zwildpat | Zvarpat _),_) :: patl, action) :: rest ->
        let vars, others = divide_rec rest in
          add_to_match vars (patl, action),
          others
    | casel ->
        Matching([], endpathl), Matching(casel, pathl)
;;

let divide_record_matching (Matching(casel, pathl)) =
  let max_pos = ref 0 in
  let rec max_size = function
      Pat(Zaliaspat(pat,v),_) -> max_size pat
    | Pat(Zconstraintpat(pat,ty),_) -> max_size pat
    | Pat(Zorpat(pat1,pat2),_) -> max_size pat1; max_size pat2
    | Pat(Zrecordpat pat_expr_list,_) ->
        do_list
          (fun (lbl,p) ->
            if lbl.info.lbl_pos > !max_pos then
              (max_pos := lbl.info.lbl_pos; ()))
          pat_expr_list
    | _ -> () in
  do_list
    (function (pat::patl, act) -> max_size pat
            | _ -> fatal_error "divide_record_matching")
    casel;
  let rec divide_rec = function
      (Pat(Zaliaspat(pat,v),_) :: patl, action) :: rest ->
        divide_rec ((pat::patl, action) :: rest)
    | (Pat(Zconstraintpat(pat,ty),_) :: patl, action) :: rest ->
        divide_rec ((pat::patl, action) :: rest)
    | (Pat(Zorpat(pat1, pat2),_) :: patl, action) :: rest ->
        divide_rec ((pat1::patl, action) :: (pat2::patl, action) :: rest)
    | (Pat(Zrecordpat pat_expr_list,_) :: patl, action) :: rest ->
        divide_rec_cont pat_expr_list patl action rest
    | (Pat((Zwildpat | Zvarpat _),_) :: patl, action) :: rest ->
        divide_rec_cont [] patl action rest
    | [] ->
        Matching([], make_path (succ !max_pos) pathl)
    | _ ->
        fatal_error "divide_record_matching"
  and divide_rec_cont pat_expr_list patl action rest =
    let v = make_vect (succ !max_pos) (Pat(Zwildpat, no_location)) in
      do_list (fun (lbl, pat) -> v.(lbl.info.lbl_pos) <- pat) pat_expr_list;
      add_to_match (divide_rec rest) (list_of_vect v @ patl, action)
  in
    divide_rec casel
;;

(* Utilities on pattern-matchings *)

let length_of_matching (Matching(casel,_)) = list_length casel
;;

let upper_left_pattern =
  let rec strip = function
      Pat(Zaliaspat(pat,_),_) -> strip pat
    | Pat(Zconstraintpat(pat,_),_) -> strip pat
    | Pat(Zorpat(pat1,pat2),_) -> strip pat1
    | pat -> pat in
  function Matching((pat::_, _) :: _, _) -> strip pat
      |                _                 -> fatal_error "upper_left_pattern"
;;

let get_span_of_constr cstr =
  match cstr.info.cs_tag with
    ConstrExtensible _        -> 0       (* Meaningless ... *)
  | ConstrRegular(_,tag,span) -> span
;;

let get_span_of_matching matching =
  match upper_left_pattern matching with
      Pat(Zconstruct0pat(c), _)   -> get_span_of_constr c
    | Pat(Zconstruct1pat(c,_), _) -> get_span_of_constr c
    | _ -> fatal_error "get_span_of_matching"
;;

(* The tri-state booleans. *)

type tristate_logic = False | Maybe | True;;

let tristate_or = function
    (True, _)     -> True
  | (_, True)     -> True
  | (False,False) -> False
  |      _        -> Maybe
;;

(* The main compilation function.
   Input: a pattern-matching,
   Output: a lambda term, a "partial" flag, a list of used cases. *)

let rec conquer_matching =
  let rec conquer_divided_matching = function
    [] ->
      [], False, []
  | (key, matchref) :: rest ->
      let lambda1, partial1, used1 = conquer_matching !matchref
      and list2,   partial2, used2 = conquer_divided_matching rest in
        (key, lambda1) :: list2,
        tristate_or(partial1,partial2),
        used1 @ used2
  in function
    Matching([], _) ->
      Lstaticfail, True, []
  | Matching(([], action) :: rest, _) ->
      action, False, [action]
  | Matching(_, (path :: _)) as matching ->
     (match upper_left_pattern matching with
        Pat((Zwildpat | Zvarpat _), _) ->
          let vars, rest = divide_var_matching matching in
          let lambda1, partial1, used1 = conquer_matching vars
          and lambda2, partial2, used2 = conquer_matching rest in
            if partial1 == False then
              lambda1, False, used1
            else
	      Lstatichandle(lambda1, lambda2),
              (if partial2 == False then False else Maybe),
              used1 @ used2
      | Pat(Ztuplepat patl, _) ->
          conquer_matching (divide_tuple_matching (list_length patl) matching)
      | Pat((Zconstruct0pat(_) | Zconstruct1pat(_,_)),_) ->
          let constrs, vars = divide_construct_matching matching in
          let switchlst, partial1, used1 = conquer_divided_matching constrs
          and lambda,    partial2, used2 = conquer_matching vars in
          let span = get_span_of_matching matching
          and num_cstr = list_length constrs in
            if num_cstr == span & partial1 == False then
              Lswitch(span, path, switchlst), False, used1
            else
              Lstatichandle(Lswitch(span, path, switchlst), lambda),
              (if partial2 == False then False
               else if num_cstr < span & partial2 == True then True
               else Maybe),
              used1 @ used2
      | Pat(Zconstantpat _,_) ->
          let constants, vars = divide_constant_matching matching in
            let condlist1, _, used1 = conquer_divided_matching constants
            and lambda2, partial2, used2 = conquer_matching vars in
              Lstatichandle(Lcond(path, condlist1), lambda2),
              partial2,
              used1 @ used2
      | Pat(Zrecordpat _,_) ->
          conquer_matching (divide_record_matching matching)
      | _ ->
          fatal_error "conquer_matching 2")
  | _ -> fatal_error "conquer_matching 1"
;;

let make_initial_matching = function
    [] ->
      fatal_error "make_initial_matching: empty"
  | (patl, _) :: _ as casel ->
      let rec make_path n =
        if n <= 0 then [] else Lvar(n-1) :: make_path(n-1)
      in
        Matching(casel, make_path(list_length patl))
;;

(* The entry point *)

let translate_matching failure_code loc casel =
  let casel' =
    map (fun (patl,l) -> (patl, share_lambda l)) casel in
  let (lambda, partial, used) =
    conquer_matching (make_initial_matching casel') in
  if not for_all (fun (_, act) -> memq act used) casel' then begin
    prerr_location loc;
    prerr_begline " Warning: some cases are unused in this matching.";
    prerr_endline2 ""
  end;
  match partial with
      False -> lambda
    |   _   -> Lstatichandle(lambda, failure_code partial)
;;
