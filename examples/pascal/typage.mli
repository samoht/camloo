#open "syntaxe";;

type erreur_de_type =
    Indefini of string      (* variable utilisee mais non definie *)
  | Conflit of string * expr_type * expr_type (* conflit de types *)
  | Arite of string * int * int     (* mauvais nombre d'arguments *)
  | Tableau_attendu             (* [..] applique e non-tableau *)
  | Tableau_interdit of string;;   (* tableau renvoye en resultat *)

exception Erreur_typage of erreur_de_type;;

value type_programme: programme -> unit
  and affiche_erreur: erreur_de_type -> unit
  and type_op_unaire: string -> expr_type * expr_type
  and type_op_binaire: string -> expr_type * expr_type * expr_type;;
