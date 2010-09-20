#open "syntaxe";;
#open "envir";;
#open "printf";;

let taille_du_mot = 4;;            (* un mot = quatre octets *)

let rec taille_du_type = function
    Integer | Boolean -> taille_du_mot
  | Array(inf, sup, ty) -> (sup - inf + 1) * taille_du_type ty;;
let val_const = function
    Entiere n -> n
  | Booleenne b -> if b then 1 else 0;;
type info_variable =
  { typ: expr_type;
    emplacement: emplacement_variable }
and emplacement_variable =
    Global_indirect of int
  | Global_direct of int
  | Local_indirect of int
  | Local_direct of int;;
let profondeur_pile = ref 0;;

let reserve_pile n =
  printf "sub sp, %d, sp\n" (n*taille_du_mot);
  profondeur_pile := !profondeur_pile + n*taille_du_mot

and libere_pile n =
  printf "add sp, %d, sp\n" (n*taille_du_mot);
  profondeur_pile := !profondeur_pile - n*taille_du_mot;;
let rec type_de env = function
    Constante(Entiere n) -> Integer
  | Constante(Booleenne b) -> Boolean
  | Variable nom -> (cherche_variable nom env).typ
  | Application(fonc, args) ->
      (cherche_fonction fonc env).fonc_type_resultat
  | Op_unaire(op, arg) ->
      let (type_arg, type_res) =
        typage__type_op_unaire op
      in type_res
  | Op_binaire(op, arg1, arg2) ->
      let (type_arg1, type_arg2, type_res) =
        typage__type_op_binaire op
      in type_res
  | Acces_tableau(arg1, arg2) ->
      match type_de env arg1 with
        Array(inf, sup, ty) -> ty;;
let rec sans_interferences env = function
    Constante c -> true
  | Variable nom ->
      let var = cherche_variable nom env in
      begin match var.emplacement with
        Global_indirect _ | Global_direct _ -> false
      | Local_indirect _  | Local_direct _  -> true
      end
  | Application(fonc, args) -> false
  | Op_unaire(op, arg) ->
      sans_interferences env arg
  | Op_binaire(op, arg1, arg2) ->
      sans_interferences env arg1 & sans_interferences env arg2
  | Acces_tableau(arg1, arg2)  ->
      sans_interferences env arg1 & sans_interferences env arg2;;
let dernier_registre = 24;;

let rec besoins env = function
    Constante c -> 0
  | Variable nom -> 0
  | Application(fonc, args) -> dernier_registre
  | Op_unaire(op, arg) -> besoins env arg
  | Op_binaire(op, arg1, arg2) -> besoins_op_binaire env arg1 arg2
  | Acces_tableau(arg1, arg2)  -> besoins_op_binaire env arg1 arg2

and besoins_op_binaire env arg1 arg2 =
  let b1 = besoins env arg1 and b2 = besoins env arg2 in
  if b1 < b2
   & (sans_interferences env arg1 or sans_interferences env arg2)
  then max b2 (b1 + 1)
  else max b1 (b2 + 1);;
let instr_pour_op = function
    "+"   -> "add"     | "-"   -> "sub"
  | "*"   -> "mult"    | "/"   -> "div"
  | "="   -> "seq"     | "<>"  -> "sne"
  | "<"   -> "slt"     | ">"   -> "sgt"
  | "<="  -> "sle"     | ">="  -> "sge"
  | "and" -> "and"     | "or"  -> "or";;

let rec compile_expr env expr reg =
  match expr with
    Constante cst ->
      printf "add r 0, %d, r %d\n" (val_const cst) reg
  | Variable nom ->
      let var = cherche_variable nom env in
      begin match var.emplacement with
        Global_indirect n ->
          printf "load r 0, %d, r %d  # %s \n" n reg nom
      | Global_direct n ->
          printf "add r 0, %d, r %d  # %s \n" n reg nom
      | Local_indirect n ->
          printf "load sp, %d, r %d  # %s \n"
                 (!profondeur_pile - n) reg nom
      | Local_direct n ->
          printf "add sp, %d, r %d  # %s \n"
                 (!profondeur_pile - n) reg nom
      end
  | Application(fonc, arguments) ->
      let nbr_args = list_length arguments in
      reserve_pile nbr_args;
      let position = ref 0 in
      do_list (function arg ->
                compile_expr env arg 1;
                printf "store sp, %d, r 1\n" !position;
                position := !position + taille_du_mot)
              arguments;
      printf "jmp F%s, ra\n" fonc;
      libere_pile nbr_args;
      if reg <> 1 then printf "add r 1, r 0, r %d\n" reg
  | Op_unaire(op, arg) ->
      compile_expr env arg reg;
      begin match op with
        "-"   -> printf "sub r 0, r %d, r %d\n" reg reg
      | "not" -> printf "seq r 0, r %d, r %d\n"  reg reg
      end
  | Op_binaire(op, arg1, Constante cst2) ->
      compile_expr env arg1 reg;
      printf "%s r %d, %d, r %d\n"
             (instr_pour_op op) reg (val_const cst2) reg
  | Op_binaire(("+" | "*" | "=" | "<>" | "and" | "or") as op,
               Constante cst1, arg2) ->
      compile_expr env arg2 reg;
      printf "%s r %d, %d, r %d\n"
             (instr_pour_op op) reg (val_const cst1) reg
  | Op_binaire(op, arg1, arg2) ->
      let (reg1, reg2) = compile_arguments env arg1 arg2 reg in      
      printf "%s r %d, r %d, r %d\n" (instr_pour_op op) reg1 reg2 reg
  | Acces_tableau(arg1, Constante cst) ->
      let (Array(inf, sup, type_elements)) = type_de env arg1 in
      compile_expr env arg1 reg;
      begin match type_elements with
        Integer | Boolean ->
          printf "load r %d, %d, r %d\n" reg
                 ((val_const cst - inf) * taille_du_mot) reg
      | Array(_, _, _) ->
          let taille = taille_du_type type_elements in
          printf "add r %d, %d, r %d\n"
                 reg ((val_const cst - inf) * taille) reg
      end
  | Acces_tableau(arg1, arg2) ->
      let (Array(inf, sup, type_elements)) = type_de env arg1 in
      let (reg1, reg2) = compile_arguments env arg1 arg2 reg in
      if inf <> 0 then printf "sub r %d, %d, r %d\n" reg2 inf reg2;
      begin match type_elements with
        Integer | Boolean ->
          printf "mult r %d, %d, r %d\n" reg2 taille_du_mot reg2;
          printf "load r %d, r %d, r %d\n" reg1 reg2 reg
      | Array(_, _, typ) ->
          let taille = taille_du_type type_elements in
          printf "mult r %d, %d, r %d\n" reg2 taille reg2;
          printf "add r %d, r %d, r %d\n" reg1 reg2 reg
      end

and compile_arguments env arg1 arg2 reg_libre =
  let b1 = besoins env arg1 and b2 = besoins env arg2 in
  if b1 < b2
   & (sans_interferences env arg1 or sans_interferences env arg2)
  then begin
    let (reg2, reg1) = compile_arguments env arg2 arg1 reg_libre in
    (reg1, reg2)
  end else begin
    compile_expr env arg1 reg_libre;
    if b2 < dernier_registre - reg_libre then begin
      compile_expr env arg2 (reg_libre + 1);
      (reg_libre, reg_libre + 1)
    end else begin
      reserve_pile 1;
      printf "store sp, 0, r %d\n" reg_libre;
      compile_expr env arg2 reg_libre;
      printf "load sp, 0, r 29\n";
      libere_pile 1;
      (29, reg_libre)
    end
  end;;
let compteur_d'etiquettes = ref 0;;

let nouvelle_etiq () =
  incr compteur_d'etiquettes; !compteur_d'etiquettes;;

let rec compile_instr env = function
    Affectation_var(nom_var,
                    Constante(Entiere 0 | Booleenne false)) ->
      affecte_var env nom_var 0
  | Affectation_var(nom_var, expr) ->
      compile_expr env expr 1;
      affecte_var env nom_var 1
  | Affectation_tableau(expr1, Constante cst2, expr3) ->
      let (Array(inf, sup, type_elements)) = type_de env expr1 in
      let (reg3, reg1) = compile_arguments env expr3 expr1 1 in
      printf "store r %d, %d, r %d\n"
             reg1 ((val_const cst2 - inf) * taille_du_mot) reg3
  | Affectation_tableau(expr1, expr2, expr3) ->
      let (Array(inf, sup, type_elements)) = type_de env expr1 in
      compile_expr env expr3 1;
      let (reg1, reg2) = compile_arguments env expr1 expr2 2 in
      if inf <> 0 then printf "sub r %d, %d, r %d\n" reg2 inf reg2;
      printf "mult r %d, %d, r %d\n" reg2 taille_du_mot reg2;
      printf "store r %d, r %d, r %d\n" reg1 reg2 1
  | Appel(proc, arguments) ->
      let nbr_args = list_length arguments in
      reserve_pile nbr_args;
      let position = ref 0 in
      do_list (function arg ->
                compile_expr env arg 1;
                printf "store sp, %d, r 1\n" !position;
                position := !position + taille_du_mot)
              arguments;
      printf "jmp P%s, ra\n" proc;
      libere_pile nbr_args
  | If(condition, branche_oui, Bloc []) ->
      let etiq_fin = nouvelle_etiq() in
      compile_expr env condition 1;
      printf "braz r 1, L%d\n" etiq_fin;
      compile_instr env branche_oui;
      printf "L%d:\n" etiq_fin
  | If(condition, Bloc [], branche_non) ->
      let etiq_fin = nouvelle_etiq() in
      compile_expr env condition 1;
      printf "branz r 1, L%d\n" etiq_fin;
      compile_instr env branche_non;
      printf "L%d:\n" etiq_fin
  | If(Op_unaire("not", condition), branche_oui, branche_non) ->
      compile_instr env (If(condition, branche_non, branche_oui))
  | If(condition, branche_oui, branche_non) ->
      let etiq_non = nouvelle_etiq() and etiq_fin = nouvelle_etiq() in
      compile_expr env condition 1;
      printf "braz r 1, L%d\n" etiq_non;
      compile_instr env branche_oui;
      printf "braz r 0, L%d\n" etiq_fin;
      printf "L%d:\n" etiq_non;
      compile_instr env branche_non;
      printf "L%d:\n" etiq_fin
  | While(condition, corps) ->
      let etiq_corps = nouvelle_etiq()
      and etiq_test = nouvelle_etiq() in
      printf "braz r 0, L%d\n" etiq_test;
      printf "L%d:\n" etiq_corps;
      compile_instr env corps;
      printf "L%d:\n" etiq_test;
      compile_expr env condition 1;
      printf "branz r 1, L%d\n" etiq_corps
  | Write expr ->
      compile_expr env expr 1;
      printf "write\n"
  | Read nom_var ->
      printf "read\n";
      affecte_var env nom_var 1
  | Bloc liste_instr ->
      do_list (compile_instr env) liste_instr

and affecte_var env nom reg =
  let var = cherche_variable nom env in
  match var.emplacement with
    Global_indirect n ->
      printf "store r 0, %d, r %d  # %s \n" n reg nom
  | Local_indirect n ->
      printf "store sp, %d, r %d  # %s \n"
             (!profondeur_pile - n) reg nom;;
let alloue_variable_locale (nom, typ) env =
  profondeur_pile := !profondeur_pile + taille_du_type typ;
  let emplacement =
    match typ with
      Integer | Boolean ->
        Local_indirect(!profondeur_pile)
    | Array(_, _, _) ->
        Local_direct(!profondeur_pile) in
  ajoute_variable nom {typ=typ; emplacement=emplacement} env;;

let alloue_parametres liste_des_parametres environnement =
  let prof = ref 0 in
  let env = ref environnement in
  do_list
   (function (nom,typ) ->
      env := ajoute_variable nom
              {typ=typ;
               emplacement = Local_indirect !prof}
              !env;
      prof := !prof - taille_du_mot)
    liste_des_parametres;
  !env;;

let compile_procedure env (nom, decl) =
  let env1 =
    alloue_parametres decl.proc_parametres env in
  profondeur_pile := taille_du_mot;
  let env2 =
    list_it alloue_variable_locale decl.proc_variables env1 in
  printf "P%s:\n" nom;
  printf "sub sp, %d, sp\n" !profondeur_pile;
  printf "store sp, %d, ra\n" (!profondeur_pile - taille_du_mot);
  compile_instr env2 decl.proc_corps;
  printf "load sp, %d, ra\n" (!profondeur_pile - taille_du_mot);
  printf "add sp, %d, sp\n" !profondeur_pile;
  printf "jmp ra, r 0\n";;

let compile_fonction env (nom, decl) =
  let env1 =
    alloue_parametres decl.fonc_parametres env in
  profondeur_pile := taille_du_mot;
  let env2 =
    list_it alloue_variable_locale decl.fonc_variables env1 in
  let env3 =
    alloue_variable_locale (nom, decl.fonc_type_resultat) env2 in
  printf "F%s:\n" nom;
  printf "sub sp, %d, sp\n" !profondeur_pile;
  printf "store sp, %d, ra\n" (!profondeur_pile - taille_du_mot);
  compile_instr env3 decl.fonc_corps;
  printf "load sp, 0, r 1\n";
  printf "load sp, %d, ra\n" (!profondeur_pile - taille_du_mot);
  printf "add sp, %d, sp\n" !profondeur_pile;
  printf "jmp ra, r 0\n";;
let adresse_donnee = ref 0;;

let alloue_variable_globale (nom, typ) env =
  let emplacement =
    match typ with
      Integer | Boolean -> Global_indirect(!adresse_donnee)
    | Array(_, _, _)    -> Global_direct(!adresse_donnee) in
  adresse_donnee := !adresse_donnee + taille_du_type typ;
  ajoute_variable nom {typ=typ; emplacement=emplacement} env;;

let compile_programme prog =
  adresse_donnee := 0;
  let env_global =
    list_it alloue_variable_globale prog.prog_variables
            (environnement_initial prog.prog_procedures
                                   prog.prog_fonctions) in
  compile_instr env_global prog.prog_corps;
  printf "stop\n";
  do_list (compile_procedure env_global) prog.prog_procedures;
  do_list (compile_fonction env_global) prog.prog_fonctions;;
