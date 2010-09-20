;; Le module 
(module
  __caml_random
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
    __caml_fchar
    __caml_filename
    __caml_float
    __caml_fstring
    __caml_fvect
    __caml_genlex
    __caml_hashtbl
    __caml_int
    __caml_io
    __caml_lexing
    __caml_list
    __caml_map
    __caml_pair
    __caml_parsing
    __caml_printexc
    __caml_printf
    __caml_queue
    __caml_set
    __caml_sort
    __caml_stack
    __caml_stream
    __caml_string
    __caml_vect
    __caml_constr
    __caml_bfloat
    __caml_bint
    __caml_bio
    __caml_bmisc
    __caml_bstring
    __caml_sys
    __caml_handle
    __caml_intext
    __caml_tag)
  (export
    state_185@random
    j_89@random
    (init_225@random x1)
    (raw_137@random x1)
    (int_184@random x1)
    (float_124@random x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define state_185@random
  '#(27182818
     49616251
     360333632
     300601409
     184774990
     330917111
     -39464308
     -122742499
     -379589510
     184143411
     433271448
     112550329
     171893862
     -135721681
     345894244
     -146029035
     48219410
     208117227
     -403419408
     -277601743
     119716478
     251640935
     -287087812
     222302733
     -113987414
     245458083
     237172296
     518844841
     -33860714
     337531551
     -10382316
     499113221
     37818178
     224789083
     189827232
     144814113
     480317358
     -293490729
     -26222612
     -92600579
     -130858790
     72374035
     -459643400
     407911833
     -201830714
     -184372209
     391227076
     -216174603
     -486169230
     -363380021
     -355865008
     -109938159
     426864862
     -510247097
     95832220))


(define j_89@random (make-cell 0))

(define (init_225@random x1)
  (begin
    (cell-set! j_89@random 0)
    (begin
      (vector-set! state_185@random 0 x1)
      (let ((stop1001 54))
        (let for1000 ((i2 1))
          (if (<=fx i2 stop1001)
            (begin
              (vector-set!
                state_185@random
                i2
                (+fx (*fx (vector-ref state_185@random (-fx i2 1))
                          31415821)
                     1))
              (for1000 (+fx i2 1)))
            (unspecified)))))))


(define (raw_137@random x1)
  (begin
    (cell-set!
      j_89@random
      (modulo (+fx (cell-ref j_89@random) 1) 55))
    (begin
      (vector-set!
        state_185@random
        (cell-ref j_89@random)
        (bit-xor
          (vector-ref
            state_185@random
            (modulo (+fx (cell-ref j_89@random) 24) 55))
          (vector-ref
            state_185@random
            (cell-ref j_89@random))))
      (bit-and
        (vector-ref
          state_185@random
          (cell-ref j_89@random))
        -1))))


(define (int_184@random x1)
  (modulo (raw_137@random #f) x1))


(define (float_124@random x1)
  (*fl (/fl (fixnum->flonum (raw_137@random #f))
            1073741824.0)
       x1))


