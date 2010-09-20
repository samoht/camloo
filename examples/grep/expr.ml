let intervalle c1 c2 =
  let rec interv n1 n2 =
    if n1 > n2 then [] else char_of_int n1 :: interv (n1 + 1) n2 in
  interv (int_of_char c1) (int_of_char c2);;

let tous_car = intervalle `\000` `\255`;;
let rec lire_expr = function
    [< lire_seq r1; (lire_alternative r1) r2 >] -> r2

and lire_alternative r1 = function
    [< '`|`; lire_expr r2 >] -> Alternative(r1,r2)
  | [< >] -> r1

and lire_seq = function
    [< lire_repet r1; (lire_fin_seq r1) r2 >] -> r2

and lire_fin_seq r1 = function
    [< lire_seq r2 >] -> Sequence(r1,r2)
  | [< >] -> r1

and lire_repet = function
    [< lire_simple r1; (lire_fin_repet r1) r2 >] -> r2

and lire_fin_repet r1 = function
    [< '`*` >] -> Repetition r1
  | [< '`+` >] -> Sequence(r1, Repetition r1)
  | [< '`?` >] -> Alternative(r1, Epsilon)
  | [< >] -> r1

and lire_simple = function
    [< '`.` >] -> Caracteres tous_car
  | [< '`[`; lire_classe cl >] -> Caracteres cl
  | [< '`(`; lire_expr r; '`)` >] -> r
  | [< '`\\`; 'c >] -> Caracteres [c]
  | [< (stream_check (function c -> c<>`|` & c<>`)` & c<>`$`)) c >] ->
      Caracteres [c]

and lire_classe = function
      [< '`^`; lire_ensemble cl >] -> subtract tous_car cl
    | [< lire_ensemble cl >] -> cl

and lire_ensemble = function
    [< '`]` >] -> []
  | [< lire_car c1; (lire_intervalle c1) c2 >] -> c2

and lire_intervalle c1 = function
    [< '`-`; lire_car c2; lire_ensemble reste >] ->
        union (intervalle c1 c2) reste
  | [< lire_ensemble reste >] -> union [c1] reste

and lire_car = function
    [< '`\\`; 'c >] -> c
  | [< 'c >] -> c;;
let lire = function
  [< (function [< '`^` >] -> true | [< >] -> false) chapeau;
     lire_expr r;
     (function [< '`$` >] -> true | [< >] -> false) dollar >] ->
  let r1 = if dollar then r else
             Sequence(r, Repetition(Caracteres tous_car)) in
  if chapeau then r1 else
    Sequence(Repetition(Caracteres tous_car), r1);;
