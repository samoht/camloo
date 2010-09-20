#open "syntaxe";;
#open "interp";;
type 'a env =
  { vars: (string * 'a) list;
    procs: (string * decl_proc) list;
    foncs: (string * decl_fonc) list };;

let environnement_initial p f =
  { vars=[]; procs=p; foncs=f };;

let ajoute_variable nom info env =
  { vars=(nom,info)::env.vars; procs=env.procs; foncs=env.foncs };;

let cherche nom liste =
  try assoc nom liste with Not_found -> raise(Pas_trouve nom);;

let cherche_variable nom env = cherche nom env.vars
and cherche_fonction nom env = cherche nom env.foncs
and cherche_procedure nom env = cherche nom env.procs;;
