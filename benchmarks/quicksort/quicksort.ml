#open "sys";;

(* Good test for loops. Best compiled with unsafe libraries. *)

let rec qsort lo hi (a : int vect) =
  if lo < hi then begin
    let i = ref lo in
    let j = ref hi in
    let pivot = a.(hi) in
    while !i < !j do
      while !i < hi & a.(!i) <= pivot do incr i done;
      while !j > lo & a.(!j) >= pivot do decr j done;
      if !i < !j then begin
        let temp = a.(!i) in a.(!i) <- a.(!j); a.(!j) <- temp
      end
    done;
    let temp = a.(!i) in a.(!i) <- a.(hi); a.(hi) <- temp;
    qsort lo (!i-1) a;
    qsort (!i+1) hi a
  end
;;

(* Same but abstract over the comparison to force spilling *)

let cmp (i : int) (j : int) = i - j;;

let rec qsort2 lo hi (a : int vect) =
  if lo < hi then begin
    let i = ref lo in
    let j = ref hi in
    let pivot = a.(hi) in
    while !i < !j do
      while !i < hi & cmp a.(!i) pivot <= 0 do incr i done;
      while !j > lo & cmp a.(!j) pivot >= 0 do decr j done;
      if !i < !j then begin
        let temp = a.(!i) in a.(!i) <- a.(!j); a.(!j) <- temp
      end
    done;
    let temp = a.(!i) in a.(!i) <- a.(hi); a.(hi) <- temp;
    qsort2 lo (!i-1) a;
    qsort2 (!i+1) hi a
  end
;;

(* Test *)

let seed = ref 0;;

let random() =
  seed := !seed * 25173 + 17431; !seed land 0xFFF
;;

exception Failed;;

let test_sort sort_fun size =
  let a = make_vect size 0 in
  let check = make_vect 4096 0 in
  for i = 0 to size-1 do
    let n = random() in a.(i) <- n; check.(n) <- check.(n)+1
  done;
  sort_fun 0 (size-1) a;
  try
    check.(a.(0)) <- check.(a.(0)) - 1;
    for i = 1 to size-1 do
      if a.(i-1) > a.(i) then raise Failed;
      check.(a.(i)) <- check.(a.(i)) - 1
    done;
    for i = 0 to 4095 do
      if check.(i) <> 0 then raise Failed
    done
 (*   print_string "OK";  print_newline()*)
  with Failed ->
 failwith "failed"(*   print_string "failed"; print_newline()*)
;;


let main () =
	let t0 = gettimeofday () in
	for i = 1 to 10 do
		test_sort qsort (i * 200000);
		let t1 = gettimeofday () in
		test_sort qsort2 (i * 200000);
		let t2 = gettimeofday () in
		print_string "QS1: ";
		print_float (t1 -. t0);
		print_string "\nQS2: ";
		print_float (t2 -. t0);
		print_newline ()
	done
;;

main();;
