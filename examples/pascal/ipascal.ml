#open "syntaxe";;

let interprete_fichier nom =
  try
    let canal = open_in nom in
    try
      let prog = lire_programme (stream_of_channel canal) in
      close_in canal;
      typage__type_programme prog;                 (* ligne ajoutee *)
      interp__execute_programme prog
    with Parse_error | Parse_failure ->
           prerr_string "Erreur de syntaxe aux alentours \
                         du caractere numero ";
           prerr_int (pos_in canal);
           prerr_endline ""
       | typage__Erreur_typage err ->              (* ligne ajoutee *)
           typage__affiche_erreur err; exit 2      (* ligne ajoutee *)
       | interp__Erreur_execution message ->
           prerr_string "Erreur pendant l'execution: ";
           prerr_endline message
  with sys__Sys_error message ->
        prerr_string "Erreur du systeme: "; prerr_endline message;;

if sys__interactive then () else
  begin interprete_fichier sys__command_line.(1); exit 0 end;;
