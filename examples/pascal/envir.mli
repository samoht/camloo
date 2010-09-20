#open "syntaxe";;
type 'a env;;
value environnement_initial:
      (string * decl_proc) list -> (string * decl_fonc) list -> 'a env
  and ajoute_variable: string -> 'a -> 'a env -> 'a env
  and cherche_variable: string -> 'a env -> 'a
  and cherche_fonction: string -> 'a env -> decl_fonc
  and cherche_procedure: string -> 'a env -> decl_proc;;
exception Pas_trouve of string;;
