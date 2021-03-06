(* Printing a location in the source program *)

(**) #open "config";;
(**) #open "lexing";;
(**) #open "parsing";;
(**) #open "misc";;

let input_name = ref ""                 (* Input file name. *)
and input_chan = ref std_in             (* The channel opened on the input. *)
and input_lexbuf = ref (obj__magic 0 : lexbuf)
                                        (* The lexer buffer on the input. *)
;;

let no_location =
  Loc(0,0)
;;

let get_current_location () =
  Loc(symbol_start(), symbol_end())
;;


let prerr_lines char1 char2 charline1 line1 line2 =
  prerr_string ", line "; prerr_int line1;
  if line2 != line1 then begin prerr_string "-"; prerr_int line2 end;
  prerr_string ", characters ";
  prerr_int (char1-charline1); prerr_string "-"; prerr_int (char2-charline1);
  prerr_string ":"
;;


let prerr_loc input seek line_flag (Loc(pos1, pos2)) =
  let prerr_chars n c =
    for i = 1 to n do prerr_char c done
  and skip_line () =
    try
      while input() != `\n` do () done
    with End_of_file -> ()
  and copy_line () =
    let c = ref ` ` in
      begin
        try while c := input(); !c != `\n` do prerr_char !c done
        with End_of_file -> prerr_string "<EOF>"
      end;
      prerr_endline ""
  and tr_line first len ch =
    let c = ref ` `
    and f = ref first
    and l = ref len
    in begin
         try while c := input (); !c != `\n`
	     do if !f > 0
	        then (f := !f - 1;
		      if !c == `\t` then prerr_char !c else prerr_char ` `)
		else if !l > 0
		then (l := !l - 1;
		      if !c == `\t` then prerr_char !c else prerr_char ch)
		else ()
	     done
	 with End_of_file -> prerr_string (make_string 5 ch)
       end
  in
      let pos = ref 0
      and line1 = ref 1
      and line1_pos = ref 0
      and line2 = ref 1
      and line2_pos = ref 0 in
        seek 0;
        begin try
          while !pos < pos1 do
            incr pos;
            if input() == `\n` then
              begin incr line1; line1_pos := !pos; () end
          done
        with End_of_file -> ()
        end;
        line2 := !line1;
        line2_pos := !line1_pos;
        begin try
          while !pos < pos2 do
            incr pos;
            if input() == `\n` then
              begin incr line2; line2_pos := !pos; () end
          done
        with End_of_file -> ()
        end;
        if line_flag then prerr_lines pos1 pos2 !line1_pos !line1 !line2;
        prerr_endline "";
        if !line1 == !line2 then begin
          seek !line1_pos;
          prerr_begline ""; copy_line ();
	  seek !line1_pos;
	  prerr_begline ""; tr_line (pos1 - !line1_pos) (pos2 - pos1) `^`;
	  prerr_endline ""
        end else begin
	  seek !line1_pos;
          prerr_begline ""; tr_line 0 (pos1 - !line1_pos) `.`;
          seek pos1;
          copy_line();
          if !line2 - !line1 <= 8 then
            for i = !line1 + 1 to !line2 - 1 do
	      prerr_begline ""; copy_line()
            done
          else
            begin
              for i = !line1 + 1 to !line1 + 3 do prerr_begline ""; copy_line() done;
              prerr_begline ".........."; prerr_endline "";
              for i = !line1 + 4 to !line2 - 4 do skip_line() done;
              for i = !line2 - 3 to !line2 - 1 do prerr_begline ""; copy_line() done
            end;
	  prerr_begline "";
          begin try
            for i = !line2_pos to pos2 - 1 do
              prerr_char(input())
            done;
            tr_line 0 100 `.`
          with End_of_file -> prerr_string "<EOF>"
          end;
          prerr_endline ""
        end
;;

let prerr_location loc =
  if string_length !input_name > 0 then begin
    let p = pos_in !input_chan in
    prerr_string "File \""; prerr_string !input_name; prerr_string "\"";
    prerr_loc (fun () -> input_char !input_chan) (seek_in !input_chan)
              true loc;
    seek_in !input_chan p
  end else begin
    prerr_begline " Toplevel input:";
    let curr_pos = ref 0 in
    let input () =
      let c =
        if !curr_pos >= 2048 then
          raise End_of_file
        else if !curr_pos >= 0 then
          nth_char !input_lexbuf.lex_buffer !curr_pos
        else
          `.`
      in
        incr curr_pos; c
    and seek pos =
      curr_pos := pos - !input_lexbuf.lex_abs_pos
    in
      prerr_loc input seek false loc
  end
;;

let prerr_input_name () =

  prerr_string "File \""; prerr_string !input_name; prerr_endline "\", line 1:"

;;
