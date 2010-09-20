#open "syntaxe";;
#open "envir";;

let verifie_type message type_attendu type_reel =
  if type_attendu <> type_reel then
    raise(Erreur_typage(Conflit(message, type_attendu, type_reel)));;

let verifie_tableau = function
    Array(inf, sup, elements) -> elements
  | _ -> raise(Erreur_typage(Tableau_attendu));;

let verifie_non_tableau message = function
    Array(inf, sup, elements) ->
      raise(Erreur_typage(Tableau_interdit message))
  | _ -> ();;
let rec type_expr env = function
    Constante(Entiere n) -> Integer
  | Constante(Booleenne b) -> Boolean
  | Variable nom_var ->
      cherche_variable nom_var env
  | Application(nom_fonc, args) ->
      let fonc = cherche_fonction nom_fonc env in
      type_application env nom_fonc fonc.fonc_parametres args;
      fonc.fonc_type_resultat
  | Op_unaire(op, arg) ->
      let (type_arg, type_res) = type_op_unaire op in
      verifie_type ("l'argument de " ^ op)
                   type_arg (type_expr env arg);
      type_res
  | Op_binaire(op, arg1, arg2) ->
      let (type_arg1, type_arg2, type_res) = type_op_binaire op in
      verifie_type ("le premier argument de " ^ op)
                   type_arg1 (type_expr env arg1);
      verifie_type ("le deuxieme argument de " ^ op)
                   type_arg2 (type_expr env arg2);
      type_res
  | Acces_tableau(expr1, expr2) ->
      let type_elements = verifie_tableau (type_expr env expr1) in
      verifie_type "l'indice de tableau"
                   Integer (type_expr env expr2);
      type_elements

and type_application env nom parametres arguments =
  let nbr_parametres = list_length parametres
  and nbr_arguments = list_length arguments in
  if nbr_parametres <> nbr_arguments then
    raise(Erreur_typage(Arite(nom, nbr_parametres, nbr_arguments)));
  let type_parametre (nom_param, type_param) argument =
    verifie_type ("le parametre " ^ nom_param ^ " de " ^ nom)
                 type_param (type_expr env argument) in
  do_list2 type_parametre parametres arguments

and type_op_unaire = function
    "-" -> (Integer, Integer)
  | "not" -> (Boolean, Boolean)

and type_op_binaire = function
    "*" | "/" | "+" | "-" -> (Integer,Integer,Integer)
  | "=" | "<>" | "<" | ">" | "<=" | ">=" -> (Integer,Integer,Boolean)
  | "and" | "or" -> (Boolean,Boolean,Boolean);;
let rec type_instr env = function
    Affectation_var(nom_var, expr) ->
      let type_var = cherche_variable nom_var env in
      verifie_non_tableau ("affectation de " ^ nom_var) type_var;
      verifie_type ("la variable " ^ nom_var)
                   type_var (type_expr env expr)
  | Affectation_tableau(expr1, expr2, expr3) ->
      let type_elements = verifie_tableau (type_expr env expr1) in
      verifie_non_tableau "affectation de tableau" type_elements;
      verifie_type "l'indice de tableau"
                   Integer (type_expr env expr2);
      verifie_type "affectation de tableau"
                   type_elements (type_expr env expr3)
  | Appel(nom_proc, args) ->
      let proc = cherche_procedure nom_proc env in
      type_application env nom_proc proc.proc_parametres args
  | If(condition, branche_oui, branche_non) ->
      verifie_type "la condition de IF"
                   Boolean (type_expr env condition);
      type_instr env branche_oui;
      type_instr env branche_non
  | While(condition, corps) ->
      verifie_type "la condition de WHILE"
                   Boolean (type_expr env condition);
      type_instr env corps
  | Write expr ->
      verifie_type "l'argument de WRITE"
                   Integer (type_expr env expr)
  | Read nom_var ->
      verifie_type "l'argument de READ"
                   Integer (cherche_variable nom_var env)
  | Bloc liste ->
      do_list (type_instr env) liste;;
let ajoute_var (nom, typ) env = ajoute_variable nom typ env;;

let type_procedure env_global (nom, decl) =
  let env =
    list_it ajoute_var
            (decl.proc_variables @ decl.proc_parametres)
            env_global in
  type_instr env decl.proc_corps;;

let type_fonction env_global (nom, decl) =
  verifie_non_tableau
    ("passage comme resultat de la fonction " ^ nom)
    decl.fonc_type_resultat;
  let env =
    list_it ajoute_var
            ((nom, decl.fonc_type_resultat) ::
              decl.fonc_variables @ decl.fonc_parametres)
            env_global in
  type_instr env decl.fonc_corps;;
let type_programme prog =
  let env_global =
    list_it ajoute_var prog.prog_variables
            (environnement_initial prog.prog_procedures
                                   prog.prog_fonctions) in
  try
    do_list (type_procedure env_global) prog.prog_procedures;
    do_list (type_fonction env_global) prog.prog_fonctions;
    type_instr env_global prog.prog_corps
  with Pas_trouve nom ->
    raise(Erreur_typage(Indefini nom));;
let rec affiche_type = function
    Integer -> prerr_string "integer"
  | Boolean -> prerr_string "boolean"
  | Array(inf, sup, ty) ->
      prerr_string "array ["; prerr_int inf; prerr_string ".."; 
      prerr_int sup; prerr_string "] of "; affiche_type ty;;

let affiche_erreur = function
    Indefini nom ->
      prerr_string "Nom inconnu: "; prerr_string nom;
      prerr_endline "."
  | Conflit(message, type_attendu, type_reel) ->
      prerr_string "Conflit de types: "; prerr_string message;
      prerr_string " devrait avoir le type ";
      affiche_type type_attendu;
      prerr_string " mais a le type "; affiche_type type_reel;
      prerr_endline "."
  | Arite(nom, nbr_parametres, nbr_arguments) ->
      prerr_string "Mauvais nombre d'arguments: "; prerr_string nom;
      prerr_string " attend "; prerr_int nbr_parametres;
      prerr_string " parametre(s), mais est appelee avec ";
      prerr_int nbr_arguments; prerr_endline " argument(s)."
  | Tableau_attendu ->
      prerr_endline "Acces dans un objet qui n'est pas un tableau."
  | Tableau_interdit message ->
      prerr_string "Operation interdite sur les tableaux: ";
      prerr_string message; prerr_endline ".";;
