type term =
    Var of int
  | Prop of head * term list
and head =
    { name: string;
      mutable props: (term * term) list };;

let lemmas = ref ([] : head list);;

let get name =
  let rec get_rec = function
    hd1::hdl ->
      if hd1.name = name then hd1 else get_rec hdl
  | [] ->
      let entry = {name = name; props = []} in
        lemmas := entry :: !lemmas;
        entry
  in get_rec !lemmas;;

type cterm = CVar of int | CProp of string * cterm list;;

let rec cterm_to_term = function
    CVar v -> Var v
  | CProp(p, l) -> Prop(get p, map cterm_to_term l);;

let add_lemma (Prop(_, [(Prop(headl,_) as left); right])) =
  headl.props <- (left, right) :: headl.props;;

let add t = add_lemma (cterm_to_term t);;
