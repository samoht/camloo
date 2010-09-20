type etat =
  { mutable dtransitions : transition vect;
    dterminal : bool }
and transition =
    Vers of etat
  | Rejet;;

value determinise : auto__etat -> determ__etat
  and reconnait : determ__etat -> string -> bool;;
