#open "expr";;

type etat =
  { mutable transitions : (char * etat) list;
    mutable epsilon_transitions : etat list;
    mutable terminal : bool;
    numero : int };;

value expr_vers_automate : expr -> etat;;
