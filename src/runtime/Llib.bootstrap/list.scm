;; Le module 
(module
  __caml_list
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
    (inline length_aux_116@list x1)
    (inline 2-51-length_aux_116@list x1 x2)
    (inline list_length_112@list x1)
    (inline @_176@list x1)
    (inline 2-190-@_176@list x1 x2)
    (inline hd_206@list x1)
    (inline tl_244@list x1)
    (inline rev_append_74@list x1)
    (inline 2-213-rev_append_74@list x1 x2)
    (inline rev_210@list x1)
    (inline do_list_18@list x1)
    (inline 2-1-do_list_18@list x1 a1000)
    (inline do_list2_49@list x1)
    (inline 3-93-do_list2_49@list x1 a1003 a1002)
    (inline map_118@list x1)
    (inline 2-147-map_118@list x1 x2)
    (inline map2_60@list x1)
    (inline 3-237-map2_60@list x1 a1007 a1006)
    (inline it_list_7@list x1)
    (inline 3-31-it_list_7@list x1 a1009 a1008)
    (inline it_list2_58@list x1)
    (inline
      4-26-it_list2_58@list
      x1
      a1013
      a1012
      a1011)
    (inline list_it_96@list x1)
    (inline 3-17-list_it_96@list x1 x2 x3)
    (inline list_it2_253@list x1)
    (inline 4-109-list_it2_253@list x1 x2 x3 x4)
    (inline flat_map_45@list x1)
    (inline 2-89-flat_map_45@list x1 a1015)
    (inline for_all_96@list x1)
    (inline 2-190-for_all_96@list x1 a1016)
    (inline exists_138@list x1)
    (inline 2-13-exists_138@list x1 a1017)
    (inline mem_169@list x1)
    (inline 2-222-mem_169@list x1 a1018)
    (inline memq_162@list x1)
    (inline 2-130-memq_162@list x1 a1019)
    (inline except_116@list x1)
    (inline 2-80-except_116@list x1 a1020)
    (inline exceptq_174@list x1)
    (inline 2-157-exceptq_174@list x1 a1021)
    (inline subtract_81@list x1)
    (inline 2-170-subtract_81@list x1 x2)
    (inline union_3@list x1)
    (inline 2-236-union_3@list x1 x2)
    (inline intersect_11@list x1)
    (inline 2-128-intersect_11@list x1 x2)
    (inline index_43@list x1)
    (inline 2-15-index_43@list x1 a1023)
    (inline assoc_252@list x1)
    (inline 2-203-assoc_252@list x1 a1024)
    (inline assq_219@list x1)
    (inline 2-10-assq_219@list x1 a1025)
    (inline mem_assoc_189@list x1)
    (inline 2-117-mem_assoc_189@list x1 a1026)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define-inline (length_aux_116@list x1)
    (lambda (x2) (2-51-length_aux_116@list x1 x2)))
 (define-inline (2-51-length_aux_116@list x1 x2)
    (if (null? x2)
      x1
      (2-51-length_aux_116@list (+fx x1 1) (cdr x2))))
)

(define-inline (list_length_112@list x1)
  (2-51-length_aux_116@list 0 x1))


(begin
  (define-inline (@_176@list x1)
    (lambda (x2) (2-190-@_176@list x1 x2)))
 (define-inline (2-190-@_176@list x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (null? x4) x2 (cons (car x4) (x3 (cdr x4)))))))
      (x3 x1)))
)

(define-inline (hd_206@list x1)
  (if (null? x1) (failwith_217@exc "hd") (car x1)))


(define-inline (tl_244@list x1)
  (if (null? x1) (failwith_217@exc "tl") (cdr x1)))


(begin
  (define-inline (rev_append_74@list x1)
    (lambda (x2) (2-213-rev_append_74@list x1 x2)))
 (define-inline (2-213-rev_append_74@list x1 x2)
    (if (null? x1)
      x2
      (2-213-rev_append_74@list
        (cdr x1)
        (cons (car x1) x2))))
)

(define-inline (rev_210@list x1)
  (2-213-rev_append_74@list x1 '()))


(begin
  (define-inline (do_list_18@list x1)
    (lambda (a1000) (2-1-do_list_18@list x1 a1000)))
 (define-inline (2-1-do_list_18@list x1 a1000)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #f
                      (begin (x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1000)))
)

(begin
  (define-inline (do_list2_49@list x1)
    (lambda (a1003)
       (lambda (a1002)
          (3-93-do_list2_49@list x1 a1003 a1002))))
 (define-inline (3-93-do_list2_49@list x1 a1003 a1002)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (labels
                         ((staticfail1001
                            ()
                            (invalid_arg_209@exc "do_list2")))
                         (if (null? x3)
                           (if (null? x4) #f (staticfail1001))
                           (if (null? x4)
                             (staticfail1001)
                             (begin
                               ((x1 (car x3)) (car x4))
                               ((x2 (cdr x3)) (cdr x4))))))))))
      ((x2 a1003) a1002)))
)

(begin
  (define-inline (map_118@list x1)
    (lambda (x2) (2-147-map_118@list x1 x2)))
 (define-inline (2-147-map_118@list x1 x2)
    (labels
      ((staticfail1004
         ()
         (letrec ((x3 (lambda (x4)
                         (if (null? x4)
                           '()
                           (cons (x1 (car x4)) (x3 (cdr x4)))))))
           (x3 x2))))
      (if (null? x2)
        '()
        (if (null? (cdr x2))
          (cons (x1 (car x2)) '())
          (if (null? (cdr (cdr x2)))
            (cons (x1 (car x2))
                  (cons (x1 (car (cdr x2))) '()))
            (staticfail1004))))))
)

(begin
  (define-inline (map2_60@list x1)
    (lambda (a1007)
       (lambda (a1006)
          (3-237-map2_60@list x1 a1007 a1006))))
 (define-inline (3-237-map2_60@list x1 a1007 a1006)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (labels
                         ((staticfail1005 () (invalid_arg_209@exc "map2")))
                         (if (null? x3)
                           (if (null? x4) '() (staticfail1005))
                           (if (null? x4)
                             (staticfail1005)
                             (cons ((x1 (car x3)) (car x4))
                                   ((x2 (cdr x3)) (cdr x4))))))))))
      ((x2 a1007) a1006)))
)

(begin
  (define-inline (it_list_7@list x1)
    (lambda (a1009)
       (lambda (a1008)
          (3-31-it_list_7@list x1 a1009 a1008))))
 (define-inline (3-31-it_list_7@list x1 a1009 a1008)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (if (null? x4)
                         x3
                         ((x2 ((x1 x3) (car x4))) (cdr x4)))))))
      ((x2 a1009) a1008)))
)

(begin
  (define-inline (it_list2_58@list x1)
    (lambda (a1013)
       (lambda (a1012)
          (lambda (a1011)
             (4-26-it_list2_58@list x1 a1013 a1012 a1011)))))
 (define-inline (4-26-it_list2_58@list x1 a1013 a1012 a1011)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (lambda (x5)
                          (labels
                            ((staticfail1010
                               ()
                               (invalid_arg_209@exc "it_list2")))
                            (if (null? x4)
                              (if (null? x5) x3 (staticfail1010))
                              (if (null? x5)
                                (staticfail1010)
                                (((x2 (((x1 x3) (car x4)) (car x5))) (cdr x4))
                                 (cdr x5))))))))))
      (((x2 a1013) a1012) a1011)))
)

(begin
  (define-inline (list_it_96@list x1)
    (lambda (x2)
       (lambda (x3) (3-17-list_it_96@list x1 x2 x3))))
 (define-inline (3-17-list_it_96@list x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (if (null? x5) x3 ((x1 (car x5)) (x4 (cdr x5)))))))
      (x4 x2)))
)

(begin
  (define-inline (list_it2_253@list x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-109-list_it2_253@list x1 x2 x3 x4)))))
 (define-inline (4-109-list_it2_253@list x1 x2 x3 x4)
    (letrec ((x5 (lambda (x6)
                    (lambda (x7)
                       (labels
                         ((staticfail1014
                            ()
                            (invalid_arg_209@exc "list_it2")))
                         (if (null? x6)
                           (if (null? x7) x4 (staticfail1014))
                           (if (null? x7)
                             (staticfail1014)
                             (((x1 (car x6)) (car x7))
                              ((x5 (cdr x6)) (cdr x7))))))))))
      ((x5 x2) x3)))
)

(begin
  (define-inline (flat_map_45@list x1)
    (lambda (a1015) (2-89-flat_map_45@list x1 a1015)))
 (define-inline (2-89-flat_map_45@list x1 a1015)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      '()
                      (2-190-@_176@list (x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1015)))
)

(begin
  (define-inline (for_all_96@list x1)
    (lambda (a1016) (2-190-for_all_96@list x1 a1016)))
 (define-inline (2-190-for_all_96@list x1 a1016)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #t
                      (and (x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1016)))
)

(begin
  (define-inline (exists_138@list x1)
    (lambda (a1017) (2-13-exists_138@list x1 a1017)))
 (define-inline (2-13-exists_138@list x1 a1017)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #f
                      (or (x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1017)))
)

(begin
  (define-inline (mem_169@list x1)
    (lambda (a1018) (2-222-mem_169@list x1 a1018)))
 (define-inline (2-222-mem_169@list x1 a1018)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #f
                      (or (tree_equal x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1018)))
)

(begin
  (define-inline (memq_162@list x1)
    (lambda (a1019) (2-130-memq_162@list x1 a1019)))
 (define-inline (2-130-memq_162@list x1 a1019)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #f
                      (or (eq? x1 (car x3)) (x2 (cdr x3)))))))
      (x2 a1019)))
)

(begin
  (define-inline (except_116@list x1)
    (lambda (a1020) (2-80-except_116@list x1 a1020)))
 (define-inline (2-80-except_116@list x1 a1020)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      '()
                      (if (tree_equal x1 (car x3))
                        (cdr x3)
                        (cons (car x3) (x2 (cdr x3))))))))
      (x2 a1020)))
)

(begin
  (define-inline (exceptq_174@list x1)
    (lambda (a1021)
       (2-157-exceptq_174@list x1 a1021)))
 (define-inline (2-157-exceptq_174@list x1 a1021)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      '()
                      (if (eq? x1 (car x3))
                        (cdr x3)
                        (cons (car x3) (x2 (cdr x3))))))))
      (x2 a1021)))
)

(begin
  (define-inline (subtract_81@list x1)
    (lambda (x2) (2-170-subtract_81@list x1 x2)))
 (define-inline (2-170-subtract_81@list x1 x2)
    (labels
      ((staticfail1022
         ()
         (letrec ((x3 (lambda (x4)
                         (if (null? x4)
                           '()
                           (if (2-222-mem_169@list (car x4) x2)
                             (x3 (cdr x4))
                             (cons (car x4) (x3 (cdr x4))))))))
           (x3 x1))))
      (if (null? x2) x1 (staticfail1022))))
)

(begin
  (define-inline (union_3@list x1)
    (lambda (x2) (2-236-union_3@list x1 x2)))
 (define-inline (2-236-union_3@list x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (null? x4)
                      x2
                      (if (2-222-mem_169@list (car x4) x2)
                        (x3 (cdr x4))
                        (cons (car x4) (x3 (cdr x4))))))))
      (x3 x1)))
)

(begin
  (define-inline (intersect_11@list x1)
    (lambda (x2) (2-128-intersect_11@list x1 x2)))
 (define-inline (2-128-intersect_11@list x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (null? x4)
                      '()
                      (if (2-222-mem_169@list (car x4) x2)
                        (cons (car x4) (x3 (cdr x4)))
                        (x3 (cdr x4)))))))
      (x3 x1)))
)

(begin
  (define-inline (index_43@list x1)
    (lambda (a1023) (2-15-index_43@list x1 a1023)))
 (define-inline (2-15-index_43@list x1 a1023)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (if (null? x4)
                         (caml-raise 'Not_found_4@exc)
                         (if (tree_equal x1 (car x4))
                           x3
                           ((x2 (+fx x3 1)) (cdr x4))))))))
      ((x2 0) a1023)))
)

(begin
  (define-inline (assoc_252@list x1)
    (lambda (a1024) (2-203-assoc_252@list x1 a1024)))
 (define-inline (2-203-assoc_252@list x1 a1024)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      (caml-raise 'Not_found_4@exc)
                      (if (tree_equal
                            x1
                            (caml-constr-get-field (car x3) 0))
                        (caml-constr-get-field (car x3) 1)
                        (x2 (cdr x3)))))))
      (x2 a1024)))
)

(begin
  (define-inline (assq_219@list x1)
    (lambda (a1025) (2-10-assq_219@list x1 a1025)))
 (define-inline (2-10-assq_219@list x1 a1025)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      (caml-raise 'Not_found_4@exc)
                      (if (eq? x1 (caml-constr-get-field (car x3) 0))
                        (caml-constr-get-field (car x3) 1)
                        (x2 (cdr x3)))))))
      (x2 a1025)))
)

(begin
  (define-inline (mem_assoc_189@list x1)
    (lambda (a1026)
       (2-117-mem_assoc_189@list x1 a1026)))
 (define-inline (2-117-mem_assoc_189@list x1 a1026)
    (letrec ((x2 (lambda (x3)
                    (if (null? x3)
                      #f
                      (or (tree_equal
                            x1
                            (caml-constr-get-field (car x3) 0))
                          (x2 (cdr x3)))))))
      (x2 a1026)))
)

