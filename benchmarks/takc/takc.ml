let rec tak x y z =
  if x > y then tak (tak (x-1) y z) (tak (y-1) z x) (tak (z-1) x y)
           else z
;;

let rec repeat n =
  if n <= 0 then 0 else tak 18 12 6 + repeat(n-1)
;;

print_int (repeat 50); print_newline()
;;
