exception Ex_undefined of string;;

type generation = GEN of (int*int) list;;

let equal (a,b : int * int) (c,d) = a == c & b == d;;

let rec map f = function
     [] -> []
   | a::x -> f a :: map f x;;

let (++) = fun f g x -> f (g x);;


let testit =

let rec rev = function
    [] -> []
  | x::l as list ->
     let rec rev_rec accu = function
         [] -> accu
       | x::l -> rev_rec (x::accu) l in rev_rec [] list in

    let error str = raise (Ex_undefined str) in

    let accumulate f a l =
	  let rec foldf a = function
              [] -> a
            | b::x -> foldf (f a b) x in
          foldf a l in

    let rec filter p =
	let consifp x a = if p a then a::x else x in
        rev ++ accumulate consifp [] in


     let rec exists p = function
        [] -> false
      | a::x -> if p a then true else exists p x in

    let rec member x a = exists (equal a) x in

    let rec _C f x y = f y x in

    let rec cons a x = a::x in

    let revonto = accumulate (_C cons) in

    let length = let count n a = n+1 in accumulate count 0 in

    let rec repeat f n x =
        if n < 0 then error "repeat<0" else
        if n == 0 then x else
        repeat f (n - 1) (f x) in

    let copy n x = repeat (cons x) n [] in

(*let implode sl =
    let spaces n = implode (copy n " ") in *)
let spaces n = String.make n ' ' in

 (* Local *)
      let rec lexordset = function
          [] -> []
        | a::x ->
           lexordset (filter (lexless a) x) @ [a] @
                     lexordset (filter (lexgreater a) x)
      and lexless((a1:int),(b1:int))(a2,b2) = 
           if a2<a1 then true else if a2==a1 then b2<b1 else false
      and lexgreater pr1 pr2 = lexless pr2 pr1 in
      let rec collect f list =
             let rec accumf sofar = function
                 [] -> sofar
               | a::x -> accumf (revonto sofar (f a)) x
              in accumf [] list in
      let rec occurs3 x = 
          (* finds coords which occur exactly 3 times in coordlist x *)
          let rec f xover x3 x2 x1 = function
              [] -> diff x3 xover
            | a::x -> 
               if member xover a then f xover x3 x2 x1 x else
               if member x3 a then f (a::xover) x3 x2 x1 x else
               if member x2 a then f xover (a::x3) x2 x1 x else
               if member x1 a then f xover x3 (a::x2) x1 x else
	       f xover x3 x2 (a::x1) x
          and diff x y = filter (fun x -> not (member y x)) x in
         f [] [] [] [] x in

      let rec alive (GEN livecoords) = livecoords
      and mkgen coordlist = GEN (lexordset coordlist)
      and mk_nextgen_fn neighbours gen =
          let living = alive gen in
          let isalive = member living in
          let liveneighbours = length ++ filter isalive ++ neighbours in
          let rec twoorthree n = n==2 or n==3 in
          let survivors = filter (twoorthree ++ liveneighbours) living in
          let newnbrlist = collect (filter (fun x -> not (isalive x)) ++ neighbours) living in
          let newborn = occurs3 newnbrlist in
          mkgen (survivors @ newborn) in

    let neighbours (i,j) =
        [(i-1,j-1); (i-1,j); (i-1,j+1); (i,j-1);
         (i,j+1); (i+1,j-1); (i+1,j); (i+1,j+1)] in

    let plot coordlist =
     let xstart = 0 and ystart = 0 in
     let rec markafter n string = string ^ spaces n ^ "0" in
     let rec plotfrom (x,y) (* current position *)
             str   (* current line being prepared -- a string *) = function
         (x1,y1)::more (* coordinates to be plotted *) ->
           if x==x1
           then (* same line so extend str and continue from y1+1 *)
                plotfrom(x,y1+1)(markafter(y1-y)str)more
           else (* flush current line and start a new line *)
                str :: plotfrom(x+1,ystart)""((x1,y1)::more)
       | [] -> [str] in
     let good (x,y) = x>=xstart & y>=ystart in
         plotfrom(xstart,ystart) "" (filter good coordlist) in

    let (@@) = fun coordlist ((x:int),(y:int)) ->
        let move(a,b) = (a+x,b+y) in map move coordlist in
    let rotate = map (fun ((x:int),(y:int)) -> (y,-x)) in

    let glider = [(0,0); (0,2); (1,1); (1,2); (2,1)] in
    let bail = [(0,0); (0,1); (1,0); (1,1)] in
    let rec barberpole n =
        let rec f i = if i==n then (n+n-1,n+n)::(n+n,n+n)::[]
                       else (i+i,i+i+1)::(i+i+2,i+i+1)::f(i+1)
        in (0,0)::(1,0)::f 0 in

    let genB = mkgen((glider @@ (2,2)) @ (bail @@ (2,12))
		     @ (rotate (barberpole 4) @@ (5,20))) in

    let rec nthgen g = function
        0 -> g
      | i -> nthgen (mk_nextgen_fn neighbours g) (i-1) in

    let gun = mkgen
     [(2,20); (3,19); (3,21); (4,18); (4,22); (4,23); (4,32); (5,7); (5,8); (5,18);
      (5,22); (5,23); (5,29); (5,30); (5,31); (5,32); (5,36); (6,7); (6,8); (6,18);
      (6,22); (6,23); (6,28); (6,29); (6,30); (6,31); (6,36); (7,19); (7,21); (7,28);
      (7,31); (7,40); (7,41); (8,20); (8,28); (8,29); (8,30); (8,31); (8,40); (8,41);
      (9,29); (9,30); (9,31); (9,32)] in

    let show pr = (List.iter (fun s -> pr s; pr "\n")) ++ plot ++ alive in

    let doit () = show (fun _ -> ()) (nthgen gun 50) in

    let testit strm = show (output_string strm) (nthgen gun 50) in

testit stdout;
print_newline();;
