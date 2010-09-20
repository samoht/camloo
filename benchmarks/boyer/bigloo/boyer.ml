#open "terms";;
#open "rules";;

(* Tautology checker *)

let rec mem x = function
    [] -> false
  | y::l -> x = y or mem x l;;

let truep x lst =
  match x with
    Prop(head, _) -> head.name = "true" or mem x lst
  | _ -> mem x lst

and falsep x lst =
  match x with
    Prop(head, _) -> head.name = "false" or mem x lst
  | _ -> mem x lst;;

let rec tautologyp x true_lst false_lst =
 if truep x true_lst then true else
 if falsep x false_lst then false else begin
(*
 print_term x; print_newline();
*)
 match x with
     Var _ -> false
   | Prop (head,[test; yes; no]) ->
        if head.name = "if" then
          if truep test true_lst then
            tautologyp yes true_lst false_lst
          else if falsep test false_lst then
            tautologyp no true_lst false_lst
          else tautologyp yes (test::true_lst) false_lst &
               tautologyp no true_lst (test::false_lst)
        else false
  end;;

let tautp x = 
  let y = rewrite x in
    tautologyp y [] [];;

(* the benchmark *)

let subst =
[Bind(23, cterm_to_term(
             CProp
              ("f",
               [CProp
                ("plus",
                 [CProp ("plus",[CVar 0; CVar 1]);
                  CProp ("plus",[CVar 2; CProp ("zero",[])])])])));
 Bind(24, cterm_to_term(
             CProp
              ("f",
               [CProp
                ("times",
                 [CProp ("times",[CVar 0; CVar 1]);
                  CProp ("plus",[CVar 2; CVar 3])])])));
 Bind(25, cterm_to_term(
             CProp
              ("f",
               [CProp
                ("reverse",
                 [CProp
                  ("append",
                   [CProp ("append",[CVar 0; CVar 1]);
                    CProp ("nil",[])])])])));
 Bind(20, cterm_to_term(
             CProp
              ("equal",
               [CProp ("plus",[CVar 0; CVar 1]);
                CProp ("difference",[CVar 23; CVar 24])])));
 Bind(22, cterm_to_term(
             CProp
              ("lt",
               [CProp ("remainder",[CVar 0; CVar 1]);
                CProp ("member",[CVar 0; CProp ("length",[CVar 1])])])))] in

let term = cterm_to_term(
           CProp
            ("implies",
             [CProp
              ("and",
               [CProp ("implies",[CVar 23; CVar 24]);
                CProp
                ("and",
                 [CProp ("implies",[CVar 24; CVar 25]);
                  CProp
                  ("and",
                   [CProp ("implies",[CVar 25; CVar 20]);
                    CProp ("implies",[CVar 20; CVar 22])])])]);
              CProp ("implies",[CVar 23; CVar 22])])) in

  if tautp (apply_subst subst term) then
    print_string "Proved!\n"
  else
    print_string "Cannot prove!\n";
  exit 0
;;
(*********
with
    failure s ->
      print_string "Exception failure("; print_string s; print_string ")\n"
  | Unify ->
      print_string "Exception Unify\n"
  | match_failure(file,start,stop) ->
      print_string "Exception match_failure(";
      print_string file;
      print_string ",";
      print_int start;
      print_string ",";
      print_int stop;
      print_string ")\n"
  | _ ->
      print_string "Exception ?\n"
;;
**********)
