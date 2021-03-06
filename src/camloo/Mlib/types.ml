(* types.ml : basic operations over types *)

#open "misc";;
#open "const";;
#open "globals";;
#open "builtins";;
#open "modules";;

(* Type constructor equality *)

let same_type_constr cstr1 cstr2 =
  cstr1.info.ty_stamp == cstr2.info.ty_stamp &
  cstr1.qualid.qual = cstr2.qualid.qual
;;

(* To take the canonical representative of a type.
   We do path compression there. *)

let rec type_repr ty =
  match ty.typ_desc with
    Tvar Tnolink ->
      ty
  | Tvar(Tlinkto t1 as r) ->
      let t2 = type_repr t1 in
        r <- Tlinkto t2; t2
  | _ ->
      ty
;;

(* The current nesting level of lets *)

let current_level = ref 0;;

let reset_type_var () =
  current_level := 0; ()
and push_type_level () =
  incr current_level; ()
and pop_type_level () =
  decr current_level; ()
;;

(* To get fresh type variables *)

let new_type_var () =
  {typ_desc = Tvar Tnolink; typ_level = !current_level}
;;

let rec type_var_list n level =
  if n <= 0
  then []
  else {typ_desc=Tvar Tnolink; typ_level=level} :: type_var_list (pred n) level
;;

let new_type_var_list n =
  type_var_list n !current_level
;;

(* To compute the free nongeneric type variables and the dangerous variables
   in a type *)

let rec free_type_vars ty =
  let ty = type_repr ty in
  match ty.typ_desc with
    Tvar _ ->
      if ty.typ_level == generic then [] else [ty]
  | Tarrow(t1,t2) ->
      free_type_vars t1 @ free_type_vars t2
  | Tproduct(ty_list) ->
      flat_map free_type_vars ty_list
  | Tconstr(c, ty_list) ->
      flat_map free_type_vars ty_list
;;

let rec dangerous_vars ty =
  let ty = type_repr ty in
  match ty.typ_desc with
    Tvar _ -> []
  | Tarrow(t1,t2) -> []
  | Tproduct(ty_list) ->
      flat_map dangerous_vars ty_list
  | Tconstr(c, ty_list) ->
      if c.info.ty_dang
      then free_type_vars ty
      else flat_map dangerous_vars ty_list
;;

(* To generalize a type *)

type type_position = Regular | Protected | Dangerous
;;

let rec gen_type pos ty =
  let ty = type_repr ty in
  begin match ty.typ_desc with
    Tvar _ ->
      if ty.typ_level > !current_level then begin
        ty.typ_level <- (if pos == Dangerous then !current_level else generic)
      end
  | Tarrow(t1,t2) ->
      let pos' =
        if pos == Dangerous then Dangerous else Protected in
      ty.typ_level <- min (gen_type pos' t1) (gen_type pos' t2)
  | Tproduct(ty_list) ->
      ty.typ_level <- gen_type_list pos ty_list
  | Tconstr(c, ty_list) ->
      ty.typ_level <-
        gen_type_list
          (if pos != Regular then pos
           else if c.info.ty_dang then Dangerous else Regular)
         ty_list
  end;
  ty.typ_level

and gen_type_list pos = function
    [] ->
      notgeneric
  | ty::rest ->
      min (gen_type pos ty) (gen_type_list pos rest)
;;

let generalize_type ty =
  let level = gen_type Regular ty in ()
and generalize_type_constr ty =
  let level = gen_type Protected ty in ()
;;

(* To take an instance of a type *)

(* Since a generic variable always has the "link" field empty (that is,
   set to Tnolink), we reuse that field to store a pointer to the
   fresh variable which is the instance of the generic variable. *)

let rec copy_type = function
    {typ_desc = Tvar(Tnolink as link); typ_level = level} as ty ->
      if level == generic
      then begin let v = new_type_var() in link <- Tlinkto v; v end
      else ty
  | {typ_desc = Tvar(Tlinkto ty); typ_level = level} ->
      if level == generic
      then ty
      else copy_type ty
  | {typ_desc = Tarrow(t1,t2); typ_level = level} as ty ->
      if level == generic
      then {typ_desc = Tarrow(copy_type t1, copy_type t2);
            typ_level = notgeneric}
      else ty
  | {typ_desc = Tproduct tlist; typ_level = level} as ty ->
      if level == generic
      then {typ_desc = Tproduct(map copy_type tlist);
            typ_level = notgeneric}
      else ty
  | {typ_desc = Tconstr(cstr, ty_list); typ_level = level} as ty ->
      if level == generic
      then {typ_desc = Tconstr(cstr, map copy_type ty_list);
            typ_level = notgeneric}
      else ty
;;

(* When copying is over, we restore the "link" field of generic variables
   to Tnolink. *)

let rec cleanup_type = function
    {typ_desc = Tvar(Tnolink); typ_level = level} as ty ->
      ()
  | {typ_desc = Tvar(Tlinkto ty as link); typ_level = level} ->
      if level == generic
      then begin link <- Tnolink end
      else cleanup_type ty
  | {typ_desc = Tarrow(t1,t2); typ_level = level} as ty ->
      if level == generic
      then (cleanup_type t1; cleanup_type t2)
      else ()
  | {typ_desc = Tproduct(tlist); typ_level = level} as ty ->
      if level == generic
      then do_list cleanup_type tlist
      else ()
  | {typ_desc = Tconstr(cstr, ty_list); typ_level = level} as ty ->
      if level == generic
      then do_list cleanup_type ty_list
      else ()
;;

(* Here are the actual instantiation functions. *)

let type_instance ty =
  let ty' = copy_type ty in
    cleanup_type ty;
    ty'

and type_pair_instance (ty1,ty2) =
  let ty1' = copy_type ty1
  and ty2' = copy_type ty2 in
    cleanup_type ty1;
    cleanup_type ty2;
    (ty1', ty2')
;;

(* Expansion of an abbreviation *)

let bind_variable ty1 ty2 =
  match ty1.typ_desc with
    Tvar(Tnolink as link) -> link <- Tlinkto ty2
  | _ -> fatal_error "bind_variable";;

let expand_abbrev params body args =
  let params' = map copy_type params
  and body' = copy_type body in
  do_list cleanup_type params;
  cleanup_type body;
  do_list2 bind_variable params' args;
  body';;

(* The occur check *)

exception Unify;;

let occur_check level0 v =
  occurs_rec where rec occurs_rec ty =
    match type_repr ty with
      {typ_desc = Tvar _; typ_level = level} as ty' ->
        if ty' == v then raise Unify
        else if level > level0 then level <- level0
        else ()
    | {typ_desc = Tarrow(t1,t2)} ->
        occurs_rec t1;
        occurs_rec t2
    | {typ_desc = Tproduct(ty_list)} ->
        do_list occurs_rec ty_list
    | {typ_desc = Tconstr(_, ty_list)} ->
        do_list occurs_rec ty_list
;;

(* Unification *)

let rec unify (ty1, ty2) =
  if ty1 == ty2 then () else begin
    let ty1 = type_repr ty1
    and ty2 = type_repr ty2 in
      if ty1 == ty2 then () else begin
        match (ty1.typ_desc, ty2.typ_desc) with
          Tvar link1, Tvar link2 ->
            if ty1.typ_level < ty2.typ_level
            then begin
              ty2.typ_level <- ty1.typ_level; link2 <- Tlinkto ty1
            end else begin
              ty1.typ_level <- ty2.typ_level; link1 <- Tlinkto ty2
            end
        | Tvar link1, _ ->
            occur_check ty1.typ_level ty1 ty2;
            link1 <- Tlinkto ty2
        | _, Tvar link2 ->
            occur_check ty2.typ_level ty2 ty1;
            link2 <- Tlinkto ty1
        | Tarrow(t1arg, t1res), Tarrow(t2arg, t2res) ->
            unify (t1arg, t2arg);
            unify (t1res, t2res)
        | Tproduct tyl1, Tproduct tyl2 ->
            unify_list (tyl1, tyl2)
        | Tconstr(cstr1, tyl1), Tconstr(cstr2, tyl2) ->
            if cstr1.info.ty_stamp == cstr2.info.ty_stamp &  (* inline exp. *)
               cstr1.qualid.qual = cstr2.qualid.qual (* of same_type_constr *)
            then unify_list (tyl1, tyl2)
            else unify_expand ty1 ty2
        | _ ->
            unify_expand ty1 ty2
      end
  end

and unify_list = function
    [], [] -> ()
  | ty1::rest1, ty2::rest2 -> unify(ty1,ty2); unify_list(rest1,rest2)
  | _ -> raise Unify

and unify_expand ty1 ty2 =
  match (ty1.typ_desc, ty2.typ_desc) with
    (Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args), _) ->
      unify (expand_abbrev params body args, ty2)
  | (_, Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args)) ->
      unify (ty1, expand_abbrev params body args)
  | (_, _) ->
      raise Unify
;;

(* Two special cases of unification *)

let rec filter_arrow ty =
  match type_repr ty with
    {typ_desc = Tvar link; typ_level = level} ->
      let ty1 = {typ_desc = Tvar Tnolink; typ_level = level}
      and ty2 = {typ_desc = Tvar Tnolink; typ_level = level} in
        link <- Tlinkto {typ_desc = Tarrow(ty1, ty2); typ_level = notgeneric};
        (ty1, ty2)
  | {typ_desc = Tarrow(ty1, ty2)} ->
      (ty1, ty2)
  | {typ_desc = Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args)} ->
      filter_arrow (expand_abbrev params body args)
  | _ ->
      raise Unify
;;

let rec filter_product arity ty =
  match type_repr ty with
    {typ_desc = Tvar link; typ_level = level} ->
      let tyl = type_var_list arity level in
      link <- Tlinkto {typ_desc = Tproduct tyl; typ_level = notgeneric};
      tyl
  | {typ_desc = Tproduct tyl} ->
      if list_length tyl == arity then tyl else raise Unify
  | {typ_desc = Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args)} ->
      filter_product arity (expand_abbrev params body args)
  | _ ->
      raise Unify
;;

(* Type matching. Instantiates ty1 so that it is equal to ty2, or raises
   Unify if not possible. Type ty2 is unmodified. Since the levels in ty1
   are not properly updated, ty1 must not be generalized afterwards. *)

let rec filter (ty1, ty2) =
  if ty1 == ty2 then () else begin
    let ty1 = type_repr ty1
    and ty2 = type_repr ty2 in
      if ty1 == ty2 then () else begin
        match (ty1.typ_desc, ty2.typ_desc) with
          Tvar link1, Tvar link2 ->
            if ty1.typ_level == generic then raise Unify;
            link1 <- Tlinkto ty2
        | Tvar link1, _ ->
            if ty1.typ_level == generic then raise Unify;
            occur_check ty1.typ_level ty1 ty2;
            link1 <- Tlinkto ty2
        | Tarrow(t1arg, t1res), Tarrow(t2arg, t2res) ->
            filter (t1arg, t2arg);
            filter (t1res, t2res)
        | Tproduct(t1args), Tproduct(t2args) ->
            filter_list (t1args, t2args)
        | Tconstr(cstr1, ty_list1), Tconstr(cstr2, ty_list2) ->
            if same_type_constr cstr1 cstr2
            then filter_list (ty_list1, ty_list2)
            else filter_expand ty1 ty2
        | _ ->
            filter_expand ty1 ty2
      end
  end

and filter_list = function
    [], [] -> ()
  | ty1::rest1, ty2::rest2 ->
      filter(ty1,ty2); filter_list(rest1,rest2)
  | _ ->
      raise Unify

and filter_expand ty1 ty2 =
  match (ty1.typ_desc, ty2.typ_desc) with
    (Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args), _) ->
      filter (expand_abbrev params body args, ty2)
  | (_, Tconstr({info = {ty_abbr = Tabbrev(params, body)}}, args)) ->
      filter (ty1, expand_abbrev params body args)
  | (_, _) ->
      raise Unify
;;

let rec arity ty =
match ty.typ_desc with
		Tarrow (t1, t2) -> 1 + arity t2
	| _ -> 0
;;
