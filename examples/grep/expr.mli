type expr =
    Epsilon
  | Caracteres of char list
  | Alternative of expr * expr
  | Sequence of expr * expr
  | Repetition of expr;;

value lire : char stream -> expr;;
