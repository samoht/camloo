
let succ x = x + 1 in
let pred2 x = x - 2 in


let rec ffib f g = function
    0 -> f 0
  | 1 -> g 1
  | n -> ffib g f (n - 1) + ffib f g (n - 2) in

print_int( ffib succ pred2 30 );;
print_newline();;

