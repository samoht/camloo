;; Le module 
(module
  __caml_fvect
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
    __caml_random
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
    (inline make_matrix_88@fvect x1)
    (inline 3-21-make_matrix_88@fvect x1 x2 x3)
    (inline blit_vect_203@fvect x1)
    (inline 5-48-blit_vect_203@fvect x1 x2 x3 x4 x5)
    (inline fill_vect_126@fvect x1)
    (inline 4-206-fill_vect_126@fvect x1 x2 x3 x4)
    (inline copy_vect_177@fvect x1)
    (inline concat_vect_32@fvect x1)
    (inline 2-164-concat_vect_32@fvect x1 x2)
    (inline sub_vect_160@fvect x1)
    (inline 3-89-sub_vect_160@fvect x1 x2 x3)
    (inline list_of_vect_3@fvect x1)
    (inline vect_of_list_150@fvect x1)
    (inline do_vect_153@fvect x1)
    (inline 2-211-do_vect_153@fvect x1 x2)
    (inline map_vect_149@fvect x1)
    (inline 2-233-map_vect_149@fvect x1 x2)
    (inline map_vect_list_65@fvect x1)
    (inline 2-221-map_vect_list_65@fvect x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define-inline (make_matrix_88@fvect x1)
    (lambda (x2)
       (lambda (x3)
          (3-21-make_matrix_88@fvect x1 x2 x3))))
 (define-inline (3-21-make_matrix_88@fvect x1 x2 x3)
    (let ((x4 (make-vector x1 #f)))
      (begin
        (let ((stop1001 (-fx x1 1)))
          (let for1000 ((i5 0))
            (if (<=fx i5 stop1001)
              (begin
                (vector-set! x4 i5 (make-vector x2 x3))
                (for1000 (+fx i5 1)))
              (unspecified))))
        x4)))
)

(begin
  (define-inline (blit_vect_203@fvect x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (lambda (x5)
                (5-48-blit_vect_203@fvect x1 x2 x3 x4 x5))))))
 (define-inline (5-48-blit_vect_203@fvect x1 x2 x3 x4 x5)
    (if (<fx x2 x4)
      (let ((stop1003 0))
        (let for1002 ((i6 (-fx x5 1)))
          (if (>=fx i6 stop1003)
            (begin
              (vector-set!
                x3
                (+fx x4 i6)
                (vector-ref x1 (+fx x2 i6)))
              (for1002 (-fx i6 1)))
            (unspecified))))
      (let ((stop1005 (-fx x5 1)))
        (let for1004 ((i6 0))
          (if (<=fx i6 stop1005)
            (begin
              (vector-set!
                x3
                (+fx x4 i6)
                (vector-ref x1 (+fx x2 i6)))
              (for1004 (+fx i6 1)))
            (unspecified))))))
)

(begin
  (define-inline (fill_vect_126@fvect x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-206-fill_vect_126@fvect x1 x2 x3 x4)))))
 (define-inline (4-206-fill_vect_126@fvect x1 x2 x3 x4)
    (let ((stop1007 (-fx (+fx x2 x3) 1)))
      (let for1006 ((i5 x2))
        (if (<=fx i5 stop1007)
          (begin
            (vector-set! x1 i5 x4)
            (for1006 (+fx i5 1)))
          (unspecified)))))
)

(define-inline (copy_vect_177@fvect x1)
  (if (eq? (let ((g1014 x1))
             (if g1014 (vector-length g1014) 0))
           0)
    x1
    (let ((x2 (make-vector
                (let ((g1015 x1))
                  (if g1015 (vector-length g1015) 0))
                (vector-ref x1 0))))
      (begin
        (5-48-blit_vect_203@fvect
          x1
          1
          x2
          1
          (-fx (let ((g1016 x1))
                 (if g1016 (vector-length g1016) 0))
               1))
        x2))))


(begin
  (define-inline (concat_vect_32@fvect x1)
    (lambda (x2) (2-164-concat_vect_32@fvect x1 x2)))
 (define-inline (2-164-concat_vect_32@fvect x1 x2)
    (if (eq? (let ((g1017 x1))
               (if g1017 (vector-length g1017) 0))
             0)
      (copy_vect_177@fvect x2)
      (if (eq? (let ((g1018 x2))
                 (if g1018 (vector-length g1018) 0))
               0)
        (copy_vect_177@fvect x1)
        (let ((x3 (make-vector
                    (+fx (let ((g1019 x1))
                           (if g1019 (vector-length g1019) 0))
                         (let ((g1020 x2))
                           (if g1020 (vector-length g1020) 0)))
                    (vector-ref x1 0))))
          (begin
            (5-48-blit_vect_203@fvect
              x1
              1
              x3
              1
              (-fx (let ((g1021 x1))
                     (if g1021 (vector-length g1021) 0))
                   1))
            (begin
              (5-48-blit_vect_203@fvect
                x2
                0
                x3
                (let ((g1022 x1))
                  (if g1022 (vector-length g1022) 0))
                (let ((g1023 x2))
                  (if g1023 (vector-length g1023) 0)))
              x3))))))
)

(begin
  (define-inline (sub_vect_160@fvect x1)
    (lambda (x2)
       (lambda (x3) (3-89-sub_vect_160@fvect x1 x2 x3))))
 (define-inline (3-89-sub_vect_160@fvect x1 x2 x3)
    (if (eq? x3 0)
      #f
      (let ((x4 (make-vector x3 (vector-ref x1 x2))))
        (begin
          (let ((stop1009 (-fx x3 1)))
            (let for1008 ((i5 1))
              (if (<=fx i5 stop1009)
                (begin
                  (vector-set! x4 i5 (vector-ref x1 (+fx x2 i5)))
                  (for1008 (+fx i5 1)))
                (unspecified))))
          x4))))
)

(define-inline (list_of_vect_3@fvect x1)
  (letrec ((x2 (lambda (x3)
                  (if (>=fx x3
                            (let ((g1024 x1))
                              (if g1024 (vector-length g1024) 0)))
                    '()
                    (cons (vector-ref x1 x3) (x2 (+fx x3 1)))))))
    (x2 0)))


(define-inline (vect_of_list_150@fvect x1)
  (if (null? x1)
    #f
    (let ((x2 (make-vector (list_length_112@list x1) (car x1))))
      (letrec ((x3 (lambda (x4)
                      (lambda (x5)
                         (if (null? x5)
                           #f
                           (begin
                             (vector-set! x2 x4 (car x5))
                             ((x3 (+fx x4 1)) (cdr x5))))))))
        (begin ((x3 1) (cdr x1)) x2)))))


(begin
  (define-inline (do_vect_153@fvect x1)
    (lambda (x2) (2-211-do_vect_153@fvect x1 x2)))
 (define-inline (2-211-do_vect_153@fvect x1 x2)
    (let ((stop1011
            (-fx (let ((g1025 x2))
                   (if g1025 (vector-length g1025) 0))
                 1)))
      (let for1010 ((i3 0))
        (if (<=fx i3 stop1011)
          (begin
            (x1 (vector-ref x2 i3))
            (for1010 (+fx i3 1)))
          (unspecified)))))
)

(begin
  (define-inline (map_vect_149@fvect x1)
    (lambda (x2) (2-233-map_vect_149@fvect x1 x2)))
 (define-inline (2-233-map_vect_149@fvect x1 x2)
    (if (eq? (let ((g1026 x2))
               (if g1026 (vector-length g1026) 0))
             0)
      #f
      (let ((x3 (make-vector
                  (let ((g1027 x2))
                    (if g1027 (vector-length g1027) 0))
                  (x1 (vector-ref x2 0)))))
        (begin
          (let ((stop1013
                  (-fx (let ((g1028 x2))
                         (if g1028 (vector-length g1028) 0))
                       1)))
            (let for1012 ((i4 1))
              (if (<=fx i4 stop1013)
                (begin
                  (vector-set! x3 i4 (x1 (vector-ref x2 i4)))
                  (for1012 (+fx i4 1)))
                (unspecified))))
          x3))))
)

(begin
  (define-inline (map_vect_list_65@fvect x1)
    (lambda (x2)
       (2-221-map_vect_list_65@fvect x1 x2)))
 (define-inline (2-221-map_vect_list_65@fvect x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (>=fx x4
                              (let ((g1029 x2))
                                (if g1029 (vector-length g1029) 0)))
                      '()
                      (cons (x1 (vector-ref x2 x4)) (x3 (+fx x4 1)))))))
      (x3 0)))
)

