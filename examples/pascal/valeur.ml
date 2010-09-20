#open "interp";;
let ent_val = function
    Ent n -> n
  | _ -> raise(Erreur_execution "entier attendu")
and bool_val = function
    Bool b -> b
  | _ -> raise(Erreur_execution "booleen attendu")
and tableau_val = function
    Tableau(inf, t) -> (inf, t)
  | _ -> raise(Erreur_execution "tableau attendu");;
let affiche_valeur v =
  print_int(ent_val v); print_newline();;

let lire_valeur () =
  let entree = read_line() in
  try Ent(int_of_string entree)
  with Failure _ -> raise(Erreur_execution "erreur de lecture");;
