;; Le module 
(module
  __caml_hashtbl
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
    (new_27@hashtbl x1)
    (clear_94@hashtbl x1)
    (resize_83@hashtbl x1)
    (bucket_too_long_84@hashtbl x1)
    (2-6-bucket_too_long_84@hashtbl x1 x2)
    (add_6@hashtbl x1)
    (3-64-add_6@hashtbl x1 x2 x3)
    (remove_141@hashtbl x1)
    (2-74-remove_141@hashtbl x1 x2)
    (find_75@hashtbl x1)
    (2-65-find_75@hashtbl x1 x2)
    (find_all_241@hashtbl x1)
    (2-48-find_all_241@hashtbl x1 x2)
    (do_table_147@hashtbl x1)
    (2-4-do_table_147@hashtbl x1 x2)
    (hash_225@hashtbl x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (new_27@hashtbl x1)
  (caml-make-regular-2 #f 2 (make-vector x1 #f)))


(define (clear_94@hashtbl x1)
  (begin
    (caml-constr-set-field! x1 0 2)
    (let ((stop1001
            (-fx (let ((g1004 (caml-constr-get-field x1 1)))
                   (if g1004 (vector-length g1004) 0))
                 1)))
      (let for1000 ((i2 0))
        (if (<=fx i2 stop1001)
          (begin
            (vector-set! (caml-constr-get-field x1 1) i2 #f)
            (for1000 (+fx i2 1)))
          (unspecified))))))


(define (resize_83@hashtbl x1)
  (let ((x2 (let ((g1005 (caml-constr-get-field x1 1)))
              (if g1005 (vector-length g1005) 0))))
    (let ((x3 (make-vector (+fx x2 x2) #f)))
      (begin
        (5-48-blit_vect_203@fvect
          (caml-constr-get-field x1 1)
          0
          x3
          0
          x2)
        (begin
          (5-48-blit_vect_203@fvect
            (caml-constr-get-field x1 1)
            0
            x3
            x2
            x2)
          (begin
            (caml-constr-set-field! x1 1 x3)
            (begin
              (caml-constr-set-field!
                x1
                0
                (*fx 2 (caml-constr-get-field x1 0)))
              #f)))))))


(begin
  (define (bucket_too_long_84@hashtbl x1)
    (lambda (x2)
       (2-6-bucket_too_long_84@hashtbl x1 x2)))
 (define (2-6-bucket_too_long_84@hashtbl x1 x2)
    (if (<fx x1 0)
      #t
      (let ((x3 x2))
        (let ((g1006 x3))
          (cond ((eq? g1006 #f) #f)
                (else
                 (2-6-bucket_too_long_84@hashtbl
                   (-fx x1 1)
                   (caml-constr-get-field x3 2))))))))
)

(begin
  (define (add_6@hashtbl x1)
    (lambda (x2)
       (lambda (x3) (3-64-add_6@hashtbl x1 x2 x3))))
 (define (3-64-add_6@hashtbl x1 x2 x3)
    (let ((x4 (modulo
                (hash_univ_param 10 100 x2)
                (let ((g1007 (caml-constr-get-field x1 1)))
                  (if g1007 (vector-length g1007) 0)))))
      (let ((x5 (caml-make-regular-3
                  #t
                  x2
                  x3
                  (vector-ref (caml-constr-get-field x1 1) x4))))
        (begin
          (vector-set! (caml-constr-get-field x1 1) x4 x5)
          (if (2-6-bucket_too_long_84@hashtbl
                (caml-constr-get-field x1 0)
                x5)
            (resize_83@hashtbl x1)
            #f)))))
)

(begin
  (define (remove_141@hashtbl x1)
    (lambda (x2) (2-74-remove_141@hashtbl x1 x2)))
 (define (2-74-remove_141@hashtbl x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1008 x4))
                      (cond ((eq? g1008 #f) #f)
                            (else
                             (if (tree_equal (caml-constr-get-field x4 0) x2)
                               (caml-constr-get-field x4 2)
                               (caml-make-regular-3
                                 #t
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 (x3 (caml-constr-get-field x4 2))))))))))
      (let ((x4 (modulo
                  (hash_univ_param 10 100 x2)
                  (let ((g1009 (caml-constr-get-field x1 1)))
                    (if g1009 (vector-length g1009) 0)))))
        (begin
          (vector-set!
            (caml-constr-get-field x1 1)
            x4
            (x3 (vector-ref (caml-constr-get-field x1 1) x4)))
          #f))))
)

(begin
  (define (find_75@hashtbl x1)
    (lambda (x2) (2-65-find_75@hashtbl x1 x2)))
 (define (2-65-find_75@hashtbl x1 x2)
    (let ((x3 (vector-ref
                (caml-constr-get-field x1 1)
                (modulo
                  (hash_univ_param 10 100 x2)
                  (let ((g1010 (caml-constr-get-field x1 1)))
                    (if g1010 (vector-length g1010) 0))))))
      (let ((g1011 x3))
        (cond ((eq? g1011 #f) (caml-raise 'Not_found_4@exc))
              (else
               (if (tree_equal x2 (caml-constr-get-field x3 0))
                 (caml-constr-get-field x3 1)
                 (let ((x4 (caml-constr-get-field x3 2)))
                   (let ((g1012 x4))
                     (cond ((eq? g1012 #f) (caml-raise 'Not_found_4@exc))
                           (else
                            (if (tree_equal x2 (caml-constr-get-field x4 0))
                              (caml-constr-get-field x4 1)
                              (let ((x5 (caml-constr-get-field x4 2)))
                                (let ((g1013 x5))
                                  (cond ((eq? g1013 #f)
                                         (caml-raise 'Not_found_4@exc))
                                        (else
                                         (if (tree_equal
                                               x2
                                               (caml-constr-get-field x5 0))
                                           (caml-constr-get-field x5 1)
                                           (letrec ((x6 (lambda (x7)
                                                           (let ((g1014 x7))
                                                             (cond ((eq? g1014
                                                                         #f)
                                                                    (caml-raise
                                                                      'Not_found_4@exc))
                                                                   (else
                                                                    (if (tree_equal
                                                                          x2
                                                                          (caml-constr-get-field
                                                                            x7
                                                                            0))
                                                                      (caml-constr-get-field
                                                                        x7
                                                                        1)
                                                                      (x6 (caml-constr-get-field
                                                                            x7
                                                                            2)))))))))
                                             (x6 (caml-constr-get-field
                                                   x5
                                                   2)))))))))))))))))))
)

(begin
  (define (find_all_241@hashtbl x1)
    (lambda (x2) (2-48-find_all_241@hashtbl x1 x2)))
 (define (2-48-find_all_241@hashtbl x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1015 x4))
                      (cond ((eq? g1015 #f) '())
                            (else
                             (if (tree_equal (caml-constr-get-field x4 0) x2)
                               (cons (caml-constr-get-field x4 1)
                                     (x3 (caml-constr-get-field x4 2)))
                               (x3 (caml-constr-get-field x4 2)))))))))
      (x3 (vector-ref
            (caml-constr-get-field x1 1)
            (modulo
              (hash_univ_param 10 100 x2)
              (let ((g1016 (caml-constr-get-field x1 1)))
                (if g1016 (vector-length g1016) 0)))))))
)

(begin
  (define (do_table_147@hashtbl x1)
    (lambda (x2) (2-4-do_table_147@hashtbl x1 x2)))
 (define (2-4-do_table_147@hashtbl x1 x2)
    (let ((x3 (let ((g1017 (caml-constr-get-field x2 1)))
                (if g1017 (vector-length g1017) 0))))
      (let ((stop1003
              (-fx (let ((g1018 (caml-constr-get-field x2 1)))
                     (if g1018 (vector-length g1018) 0))
                   1)))
        (let for1002 ((i4 0))
          (if (<=fx i4 stop1003)
            (begin
              (letrec ((x6 (lambda (x7)
                              (let ((g1019 x7))
                                (cond ((eq? g1019 #f) #f)
                                      (else
                                       (if (eq? (modulo
                                                  (hash_univ_param
                                                    10
                                                    100
                                                    (caml-constr-get-field
                                                      x7
                                                      0))
                                                  x3)
                                                i4)
                                         (begin
                                           ((x1 (caml-constr-get-field x7 0))
                                            (caml-constr-get-field x7 1))
                                           (x6 (caml-constr-get-field x7 2)))
                                         (x6 (caml-constr-get-field
                                               x7
                                               2)))))))))
                (x6 (vector-ref (caml-constr-get-field x2 1) i4)))
              (for1002 (+fx i4 1)))
            (unspecified))))))
)

(define (hash_225@hashtbl x1)
  (hash_univ_param 50 500 x1))


