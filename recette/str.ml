let str = make_string 5 `a` in
fill_string str 1 3 `b`;
prerr_string str;
prerr_string "\n";
flush stderr;;
