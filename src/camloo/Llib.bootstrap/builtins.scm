;; Le module 
(module
  __caml_builtins
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_modules)
  (export
    (builtin_44@builtins x1)
    (2-58-builtin_44@builtins x1 x2)
    (builtin_constr_146@builtins x1)
    constr_type_unit_143@builtins
    constr_type_exn_222@builtins
    constr_type_bool_225@builtins
    constr_type_int_67@builtins
    constr_type_float_206@builtins
    constr_type_string_50@builtins
    constr_type_char_103@builtins
    constr_type_list_127@builtins
    constr_type_vect_239@builtins
    constr_type_stream_36@builtins
    (type_arrow_66@builtins x1)
    (type_product_184@builtins x1)
    type_unit_26@builtins
    type_exn_242@builtins
    type_bool_127@builtins
    type_int_120@builtins
    type_float_74@builtins
    type_string_24@builtins
    type_char_168@builtins
    (type_vect_74@builtins x1)
    (type_stream_55@builtins x1)
    constr_void_11@builtins
    constr_nil_72@builtins
    constr_cons_77@builtins
    constr_false_68@builtins
    constr_true_207@builtins
    match_failure_tag_73@builtins
    constr_match_failure_87@builtins
    module_builtin_82@builtins))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (builtin_44@builtins x1)
    (lambda (x2) (2-58-builtin_44@builtins x1 x2)))
 (define (2-58-builtin_44@builtins x1 x2)
    (caml-make-regular-2
      #f
      (caml-make-regular-2 #f "builtin" x1)
      x2))
)

(define (builtin_constr_146@builtins x1)
  (caml-make-regular-2 #f "builtin" x1))


(begin
  (define constr_type_unit_143@builtins
    (2-58-builtin_44@builtins
      "unit"
      (caml-make-regular-3 #f 2 #f #f)))
 (begin
    (define constr_type_exn_222@builtins
      (2-58-builtin_44@builtins
        "exn"
        (caml-make-regular-3 #f 3 #f #f)))
   (begin
      (define constr_type_bool_225@builtins
        (2-58-builtin_44@builtins
          "bool"
          (caml-make-regular-3 #f 4 #f #f)))
     (begin
        (define constr_type_int_67@builtins
          (2-58-builtin_44@builtins
            "int"
            (caml-make-regular-3 #f 5 #f #f)))
       (begin
          (define constr_type_float_206@builtins
            (2-58-builtin_44@builtins
              "float"
              (caml-make-regular-3 #f 6 #f #f)))
         (begin
            (define constr_type_string_50@builtins
              (2-58-builtin_44@builtins
                "string"
                (caml-make-regular-3 #f 7 #f #f)))
           (begin
              (define constr_type_char_103@builtins
                (2-58-builtin_44@builtins
                  "char"
                  (caml-make-regular-3 #f 8 #f #f)))
             (begin
                (define constr_type_list_127@builtins
                  (2-58-builtin_44@builtins
                    "list"
                    (caml-make-regular-3 #f 9 #f #f)))
               (begin
                  (define constr_type_vect_239@builtins
                    (2-58-builtin_44@builtins
                      "vect"
                      (caml-make-regular-3 #f 10 #t #f)))
                 (define constr_type_stream_36@builtins
                    '#(#("stream" "stream" #f) #(1 #f #f #f) #f))
)))))))))

(begin
  (define (type_arrow_66@builtins x1)
    (caml-make-regular-2
      #f
      (caml-make-regular-2
        #t
        (caml-constr-get-field x1 0)
        (caml-constr-get-field x1 1))
      notgeneric_227@globals))
 (begin
    (define (type_product_184@builtins x1)
      (caml-make-regular-2
        #f
        (caml-make-regular-1 #unspecified x1)
        notgeneric_227@globals))
   (begin
      (define type_unit_26@builtins
        (caml-make-regular-2
          #f
          (caml-make-regular-2
            #u0000
            constr_type_unit_143@builtins
            '())
          notgeneric_227@globals))
     (begin
        (define type_exn_242@builtins
          (caml-make-regular-2
            #f
            (caml-make-regular-2
              #u0000
              constr_type_exn_222@builtins
              '())
            notgeneric_227@globals))
       (begin
          (define type_bool_127@builtins
            (caml-make-regular-2
              #f
              (caml-make-regular-2
                #u0000
                constr_type_bool_225@builtins
                '())
              notgeneric_227@globals))
         (begin
            (define type_int_120@builtins
              (caml-make-regular-2
                #f
                (caml-make-regular-2
                  #u0000
                  constr_type_int_67@builtins
                  '())
                notgeneric_227@globals))
           (begin
              (define type_float_74@builtins
                (caml-make-regular-2
                  #f
                  (caml-make-regular-2
                    #u0000
                    constr_type_float_206@builtins
                    '())
                  notgeneric_227@globals))
             (begin
                (define type_string_24@builtins
                  (caml-make-regular-2
                    #f
                    (caml-make-regular-2
                      #u0000
                      constr_type_string_50@builtins
                      '())
                    notgeneric_227@globals))
               (begin
                  (define type_char_168@builtins
                    (caml-make-regular-2
                      #f
                      (caml-make-regular-2
                        #u0000
                        constr_type_char_103@builtins
                        '())
                      notgeneric_227@globals))
                 (begin
                    (define (type_vect_74@builtins x1)
                      (caml-make-regular-2
                        #f
                        (caml-make-regular-2
                          #u0000
                          constr_type_vect_239@builtins
                          (cons x1 '()))
                        notgeneric_227@globals))
                   (define (type_stream_55@builtins x1)
                      (caml-make-regular-2
                        #f
                        (caml-make-regular-2
                          #u0000
                          constr_type_stream_36@builtins
                          (cons x1 '()))
                        notgeneric_227@globals))
))))))))))

(define constr_void_11@builtins
  (2-58-builtin_44@builtins
    "()"
    (caml-make-regular
      #f
      5
      (caml-make-regular-2
        #f
        (caml-make-regular-2
          #u0000
          constr_type_unit_143@builtins
          '())
        notgeneric_227@globals)
      type_unit_26@builtins
      #t
      (caml-make-regular-3
        #t
        (builtin_constr_146@builtins "()")
        0
        1)
      #f)))


(begin
  (define constr_nil_72@builtins
    (let ((x1 (caml-make-regular-2
                #f
                (caml-make-regular-1 #f #f)
                generic_255@globals)))
      (2-58-builtin_44@builtins
        "[]"
        (caml-make-regular
          #f
          5
          (caml-make-regular-2
            #f
            (caml-make-regular-2
              #u0000
              constr_type_list_127@builtins
              (cons x1 '()))
            generic_255@globals)
          type_unit_26@builtins
          #t
          (caml-make-regular-3
            #t
            (builtin_constr_146@builtins "[]")
            0
            2)
          #f))))
 (define constr_cons_77@builtins
    (let ((x1 (caml-make-regular-2
                #f
                (caml-make-regular-1 #f #f)
                generic_255@globals)))
      (let ((x2 (caml-make-regular-2
                  #f
                  (caml-make-regular-2
                    #u0000
                    constr_type_list_127@builtins
                    (cons x1 '()))
                  generic_255@globals)))
        (2-58-builtin_44@builtins
          "::"
          (caml-make-regular
            #f
            5
            x2
            (caml-make-regular-2
              #f
              (caml-make-regular-1
                #unspecified
                (cons x1 (cons x2 '())))
              generic_255@globals)
            #t
            (caml-make-regular-3
              #t
              (builtin_constr_146@builtins "::")
              1
              2)
            '#(2 #unspecified))))))
)

(begin
  (define constr_false_68@builtins
    (2-58-builtin_44@builtins
      "false"
      (caml-make-regular
        #f
        5
        (caml-make-regular-2
          #f
          (caml-make-regular-2
            #u0000
            constr_type_bool_225@builtins
            '())
          notgeneric_227@globals)
        type_unit_26@builtins
        #t
        (caml-make-regular-3
          #t
          (builtin_constr_146@builtins "false")
          0
          2)
        #f)))
 (define constr_true_207@builtins
    (2-58-builtin_44@builtins
      "true"
      (caml-make-regular
        #f
        5
        (caml-make-regular-2
          #f
          (caml-make-regular-2
            #u0000
            constr_type_bool_225@builtins
            '())
          notgeneric_227@globals)
        type_unit_26@builtins
        #t
        (caml-make-regular-3
          #t
          (builtin_constr_146@builtins "true")
          1
          2)
        #f)))
)

(define match_failure_tag_73@builtins
  '#(#("builtin" "Match_failure" #f) 1 #f))


(define constr_match_failure_87@builtins
  (2-58-builtin_44@builtins
    "Match_failure"
    (caml-make-regular
      #f
      5
      (caml-make-regular-2
        #f
        (caml-make-regular-2
          #u0000
          constr_type_exn_222@builtins
          '())
        notgeneric_227@globals)
      (type_product_184@builtins
        (cons type_string_24@builtins
              (cons type_int_120@builtins
                    (cons type_int_120@builtins '()))))
      #t
      match_failure_tag_73@builtins
      '#(3 #unspecified))))


(define module_builtin_82@builtins
  (new_module_72@modules "builtin"))


((do_list_18@list
   (lambda (x1)
      (((add_6@hashtbl
          (caml-constr-get-field
            module_builtin_82@builtins
            4))
        (caml-constr-get-field x1 0))
       (2-58-builtin_44@builtins
         (caml-constr-get-field x1 0)
         (caml-constr-get-field x1 1)))))
 (cons (caml-make-regular-2
         #f
         "unit"
         (caml-make-regular-3
           #f
           constr_type_unit_143@builtins
           0
           (caml-make-regular-1
             #t
             (cons constr_void_11@builtins '()))))
       (cons (caml-make-regular-2
               #f
               "exn"
               (caml-make-regular-3
                 #f
                 constr_type_exn_222@builtins
                 0
                 '#(() #t)))
             (cons (caml-make-regular-2
                     #f
                     "bool"
                     (caml-make-regular-3
                       #f
                       constr_type_bool_225@builtins
                       0
                       (caml-make-regular-1
                         #t
                         (cons constr_false_68@builtins
                               (cons constr_true_207@builtins '())))))
                   (cons (caml-make-regular-2
                           #f
                           "int"
                           (caml-make-regular-3
                             #f
                             constr_type_int_67@builtins
                             0
                             #f))
                         (cons (caml-make-regular-2
                                 #f
                                 "float"
                                 (caml-make-regular-3
                                   #f
                                   constr_type_float_206@builtins
                                   0
                                   #f))
                               (cons (caml-make-regular-2
                                       #f
                                       "string"
                                       (caml-make-regular-3
                                         #f
                                         constr_type_string_50@builtins
                                         0
                                         #f))
                                     (cons (caml-make-regular-2
                                             #f
                                             "char"
                                             (caml-make-regular-3
                                               #f
                                               constr_type_char_103@builtins
                                               0
                                               #f))
                                           (cons (caml-make-regular-2
                                                   #f
                                                   "list"
                                                   (caml-make-regular-3
                                                     #f
                                                     constr_type_list_127@builtins
                                                     1
                                                     (caml-make-regular-1
                                                       #t
                                                       (cons constr_nil_72@builtins
                                                             (cons constr_cons_77@builtins
                                                                   '())))))
                                                 (cons (caml-make-regular-2
                                                         #f
                                                         "vect"
                                                         (caml-make-regular-3
                                                           #f
                                                           constr_type_vect_239@builtins
                                                           1
                                                           #f))
                                                       '()))))))))))

((do_list_18@list
   (lambda (x1)
      (((add_6@hashtbl
          (caml-constr-get-field
            module_builtin_82@builtins
            2))
        (caml-constr-get-field
          (caml-constr-get-field x1 0)
          1))
       x1)))
 (cons constr_void_11@builtins
       (cons constr_nil_72@builtins
             (cons constr_cons_77@builtins
                   (cons constr_true_207@builtins
                         (cons constr_false_68@builtins
                               (cons constr_match_failure_87@builtins '())))))))

(((add_6@hashtbl module_table_28@modules)
  "builtin")
 module_builtin_82@builtins)

