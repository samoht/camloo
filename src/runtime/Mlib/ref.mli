(* Operations on references *)

type 'a ref = ref of mutable 'a;;

value prefix ! : 'a ref -> 'a = 1 "cell-ref"
        (* [!r] returns the current contents of reference [r].
           Could be defined as [fun (ref x) -> x]. *)
  and prefix := : 'a ref -> 'a -> unit = 2 "cell-set!"
        (* [r := a] stores the value of [a] in reference [r]. *)
  and incr : int ref -> unit = 1 "incr"
        (* Increment the integer contained in the given reference.
           Could be defined as [fun r -> r := succ !r]. *)
  and decr : int ref -> unit = 1 "decr"
        (* Decrement the integer contained in the given reference.
           Could be defined as [fun r -> r := pred !r]. *)
;;
