exception echec;;

let reconnait automate chaine =
  let etat_courant = ref automate in 
  try
    for i = 0 to string_length chaine - 1 do
    match !etat_courant.dtransitions.(int_of_char(nth_char chaine i))
    with Rejet  -> raise echec
       | Vers e -> etat_courant := e
    done;
    !etat_courant.dterminal
  with echec -> false;;
#open "auto";;

type ensemble_d'etats =
  { contenu  : ensent__t;
    elements : auto__etat list };;
let vide = { contenu = ensent__vide; elements = [] };;
let est_vide ens =
  match ens.elements with [] -> true | _ -> false;;
let appartient etat ens =
  ensent__appartient etat.numero ens.contenu;;
let ajoute etat ens =
  { contenu  = ensent__ajoute etat.numero ens.contenu;
    elements = etat :: ens.elements };;
let rec ajoute_fermeture etat ferm =
  if appartient etat ferm then ferm else
    list_it ajoute_fermeture
            etat.epsilon_transitions (ajoute etat ferm);;

let fermeture etat = ajoute_fermeture etat vide;;

let fermeture_ens ens = list_it ajoute_fermeture ens.elements vide;;
let deplacements liste_etats =
  let t = make_vect 256 vide in
  do_list
    (function etat ->
      do_list
        (function (car, dest) ->
          let i = int_of_char car in t.(i) <- ajoute dest t.(i))
      etat.transitions)
    liste_etats;
  t;;
let determinise etat_initial =
  let etats_connus = hashtbl__new 51
  and a_remplir = stack__new () in
  let traduire ens =
    try hashtbl__find etats_connus ens.contenu
    with Not_found ->
      let nouvel_etat =
        { dterminal = exists (function n -> n.terminal) ens.elements;
          dtransitions = make_vect 256 Rejet } in
      hashtbl__add etats_connus ens.contenu nouvel_etat;
      stack__push (ens.elements, nouvel_etat) a_remplir;
      nouvel_etat in
  let nouvel_etat_initial =
    traduire (fermeture etat_initial) in
  begin try
    while true do
      let (liste, nouvel_etat) = stack__pop a_remplir in
      let depl = deplacements liste in
      for i = 0 to 255 do
        if not est_vide depl.(i) then
          nouvel_etat.dtransitions.(i) <-
            Vers(traduire (fermeture_ens depl.(i)))
      done
    done
  with stack__Empty -> ()
  end;
  nouvel_etat_initial;;
