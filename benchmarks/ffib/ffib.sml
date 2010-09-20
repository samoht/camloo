structure Main : BMARK =
  struct
    
  fun succ (x:int) = x + 1
  fun pred2 (x:int) = x - 2

  fun ffibu ((f:int -> int), g, n) = 
    if (n = 0) then f 0 else 
    if (n = 1) then g 1 else
    ffibu (g, f, (n - 1)) + ffibu( f, g, (n - 2) )
                                     
  fun ffibc (f:int -> int) g 0 = f 0
  | ffibc f g 1 = g 1
  | ffibc f g n = ffibc g f (n - 1) + ffibc f g (n - 2)

  fun testit outstream =
    (output(outstream, makestring( ffibu( succ, pred2, 30)) );
     output(outstream, "\n"))

  fun doit () = testit std_out

  fun main(_,_) =
    doit ();
end;
