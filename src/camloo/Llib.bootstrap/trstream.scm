;; Le module 
(module
  __caml_trstream
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_syntax
    __caml_globals
    __caml_prim
    __caml_lambda
    __caml_match
    __caml_tr_env)
  (export
    sempty_tag_189@trstream
    scons_tag_245@trstream
    sapp_tag_42@trstream
    sfunc_tag_64@trstream
    parse_failure_tag_183@trstream
    (translate_stream_2@trstream x1)
    (3-121-translate_stream_2@trstream x1 x2 x3)
    (stream_oper_137@trstream x1)
    (stream_raise_169@trstream x1)
    (2-49-stream_raise_169@trstream x1 x2)
    raise_parse_failure_133@trstream
    raise_parse_error_213@trstream
    (catch_parse_failure_60@trstream x1)
    (divide_term_parsing_216@trstream x1)
    access_stream_157@trstream
    (translate_parser_248@trstream x1)
    (4-247-translate_parser_248@trstream x1 x2 x3 x4)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define sempty_tag_189@trstream
    '#(#("builtin" "Sempty" #f) 0 5 #t))
 (begin
    (define scons_tag_245@trstream
      '#(#("builtin" "Scons" #f) 1 5 #t))
   (begin
      (define sapp_tag_42@trstream
        '#(#("builtin" "Sapp" #f) 2 5 #t))
     (define sfunc_tag_64@trstream
        '#(#("builtin" "Sfunc" #f) 3 5 #t))
)))

(define parse_failure_tag_183@trstream 10)

(begin
  (define (translate_stream_2@trstream x1)
    (lambda (x2)
       (lambda (x3)
          (3-121-translate_stream_2@trstream x1 x2 x3))))
 (define (3-121-translate_stream_2@trstream x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (lambda (x6)
                       (if (null? x6)
                         (caml-make-regular-1
                           #t
                           (caml-make-regular-2
                             #t
                             sempty_tag_189@trstream
                             '()))
                         (labels
                           ((staticfail1000
                              ()
                              (let ((x7 (let ((x7 (car x6)))
                                          (case (caml-regular-constr-tag x7)
                                            ((1) scons_tag_245@trstream)
                                            (else sapp_tag_42@trstream)))))
                                (let ((x8 (let ((x8 (car x6)))
                                            (case (caml-regular-constr-tag x8)
                                              ((1) (caml-constr-get-field x8 0))
                                              (else
                                               (caml-constr-get-field x8 0))))))
                                  (caml-make-regular-2
                                    #<0007>
                                    (caml-make-regular-1
                                      #<0007>
                                      sfunc_tag_64@trstream)
                                    (cons (caml-make-regular-1
                                            #u0000
                                            (caml-make-regular-2
                                              #<0007>
                                              (caml-make-regular-1 #<0007> x7)
                                              (cons ((x1 (caml-make-regular-1
                                                           #t
                                                           x5))
                                                     x8)
                                                    (cons ((x4 (caml-make-regular-1
                                                                 #t
                                                                 x5))
                                                           (cdr x6))
                                                          '()))))
                                          (cons (caml-make-regular-1
                                                  #t
                                                  const_unit_249@const)
                                                '())))))))
                           (case (if (caml-constant-constr? (car x6))
                                   -1
                                   (caml-regular-constr-tag (car x6)))
                             ((2)
                              (if (null? (cdr x6))
                                (caml-make-regular-2
                                  #<0007>
                                  (caml-make-regular-1
                                    #<0007>
                                    sfunc_tag_64@trstream)
                                  (cons (caml-make-regular-1
                                          #u0000
                                          ((x1 (caml-make-regular-1 #t x5))
                                           (caml-constr-get-field (car x6) 0)))
                                        (cons (caml-make-regular-1
                                                #t
                                                const_unit_249@const)
                                              '())))
                                (staticfail1000)))
                             (else (staticfail1000)))))))))
      ((x4 x2) x3)))
)

(define (stream_oper_137@trstream x1)
  (caml-make-regular-2
    #<0007>
    (caml-make-regular-1
      #t
      (caml-make-regular-2 #f "stream" x1))
    '()))


(begin
  (define (stream_raise_169@trstream x1)
    (lambda (x2)
       (2-49-stream_raise_169@trstream x1 x2)))
 (define (2-49-stream_raise_169@trstream x1 x2)
    (caml-make-regular-2
      #<0007>
      #<000c>
      (cons (caml-make-regular-1
              #t
              (caml-make-regular-2
                #t
                (caml-make-regular-2
                  #f
                  (caml-make-regular-2 #f "stream" x1)
                  x2)
                '()))
            '())))
)

(begin
  (define raise_parse_failure_133@trstream
    (2-49-stream_raise_169@trstream
      "Parse_failure"
      1))
 (define raise_parse_error_213@trstream
    (2-49-stream_raise_169@trstream "Parse_error" 2))
)

(define (catch_parse_failure_60@trstream x1)
  (caml-make-regular-2
    #<000c>
    x1
    (caml-make-regular-3
      #<000d>
      (caml-make-regular-2
        #<0007>
        '#(#f #<0006>)
        (cons '#(#<0008> (#(0 #f)) #<0007>)
              (cons (caml-make-regular-1
                      #t
                      (caml-make-regular-1
                        #f
                        (caml-make-regular-1
                          #f
                          parse_failure_tag_183@trstream)))
                    '())))
      #<000a>
      '#(#<000c> (#(0 #f)) #<0007>))))


(define (divide_term_parsing_216@trstream x1)
  (labels
    ((staticfail1001
       ()
       (caml-make-regular-2 #f '() x1)))
    (if (null? x1)
      (staticfail1001)
      (if (null? (caml-constr-get-field (car x1) 0))
        (staticfail1001)
        (case (if (caml-constant-constr?
                    (car (caml-constr-get-field (car x1) 0)))
                -1
                (caml-regular-constr-tag
                  (car (caml-constr-get-field (car x1) 0))))
          ((1)
           (let ((x2 (divide_term_parsing_216@trstream (cdr x1))))
             (caml-make-regular-2
               #f
               (cons (caml-make-regular-2
                       #f
                       (caml-constr-get-field
                         (car (caml-constr-get-field (car x1) 0))
                         0)
                       (caml-make-regular-2
                         #f
                         (cdr (caml-constr-get-field (car x1) 0))
                         (caml-constr-get-field (car x1) 1)))
                     (caml-constr-get-field x2 0))
               (caml-constr-get-field x2 1))))
          (else (staticfail1001)))))))


(define access_stream_157@trstream
  (translate_access_117@tr_env "%stream"))


(begin
  (define (translate_parser_248@trstream x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-247-translate_parser_248@trstream x1 x2 x3 x4)))))
 (define (4-247-translate_parser_248@trstream x1 x2 x3 x4)
    (letrec ((x5 (lambda (x6)
                    (lambda (x7)
                       (let ((x8 (caml-constr-get-field x7 0)))
                         (if (null? x8)
                           ((x1 x6) (caml-constr-get-field x7 1))
                           (case (caml-regular-constr-tag (car x8))
                             ((1)
                              (let ((x9 (2-244-add_pat_to_env_200@tr_env
                                          x6
                                          (caml-constr-get-field (car x8) 0))))
                                (caml-make-regular-2
                                  #a000
                                  (cons (caml-make-regular-2
                                          #unspecified
                                          (stream_oper_137@trstream
                                            "stream_require")
                                          (cons (access_stream_157@trstream x6)
                                                '()))
                                        '())
                                  (3-10-translate_matching_84@match
                                    (lambda (x10)
                                       raise_parse_error_213@trstream)
                                    x2
                                    (cons (caml-make-regular-2
                                            #f
                                            (cons (caml-constr-get-field
                                                    (car x8)
                                                    0)
                                                  '())
                                            ((caml-constr-get-field x9 1)
                                             (caml-make-regular-2
                                               #<000e>
                                               (caml-make-regular-2
                                                 #unspecified
                                                 (stream_oper_137@trstream
                                                   "stream_junk")
                                                 (cons (access_stream_157@trstream
                                                         (caml-constr-get-field
                                                           x9
                                                           0))
                                                       '()))
                                               ((x5 (caml-constr-get-field
                                                      x9
                                                      0))
                                                (caml-make-regular-2
                                                  #f
                                                  (cdr x8)
                                                  (caml-constr-get-field
                                                    x7
                                                    1))))))
                                          '())))))
                             ((2)
                              (let ((x9 (2-244-add_pat_to_env_200@tr_env
                                          x6
                                          (caml-constr-get-field (car x8) 1))))
                                (caml-make-regular-2
                                  #a000
                                  (cons (caml-make-regular-2
                                          #unspecified
                                          (stream_oper_137@trstream
                                            "parser_require")
                                          (cons ((x1 x6)
                                                 (caml-constr-get-field
                                                   (car x8)
                                                   0))
                                                (cons (access_stream_157@trstream
                                                        x6)
                                                      '())))
                                        '())
                                  (3-10-translate_matching_84@match
                                    (lambda (x10)
                                       raise_parse_error_213@trstream)
                                    x2
                                    (cons (caml-make-regular-2
                                            #f
                                            (cons (caml-constr-get-field
                                                    (car x8)
                                                    1)
                                                  '())
                                            ((caml-constr-get-field x9 1)
                                             ((x5 (caml-constr-get-field x9 0))
                                              (caml-make-regular-2
                                                #f
                                                (cdr x8)
                                                (caml-constr-get-field x7 1)))))
                                          '())))))
                             (else
                              (caml-make-regular-2
                                #a000
                                (cons (access_stream_157@trstream x6) '())
                                ((x5 (caml-make-regular-2
                                       #unspecified
                                       (cons (caml-make-regular-2
                                               #f
                                               (caml-constr-get-field
                                                 (car x8)
                                                 0)
                                               #f)
                                             '())
                                       x6))
                                 (caml-make-regular-2
                                   #f
                                   (cdr x8)
                                   (caml-constr-get-field x7 1))))))))))))
      (letrec ((x6 (lambda (x7)
                      (lambda (x8)
                         (let ((x9 x8))
                           (if (null? x9)
                             raise_parse_failure_133@trstream
                             (if (null? (caml-constr-get-field (car x9) 0))
                               ((x1 x7) (caml-constr-get-field (car x9) 1))
                               (case (caml-regular-constr-tag
                                       (car (caml-constr-get-field (car x9) 0)))
                                 ((1)
                                  (let ((x10 (lambda (x10)
                                                (let ((x11 (2-244-add_pat_to_env_200@tr_env
                                                             x7
                                                             (caml-constr-get-field
                                                               x10
                                                               0))))
                                                  (caml-make-regular-2
                                                    #f
                                                    (cons (caml-constr-get-field
                                                            x10
                                                            0)
                                                          '())
                                                    ((caml-constr-get-field
                                                       x11
                                                       1)
                                                     (caml-make-regular-2
                                                       #<000e>
                                                       (caml-make-regular-2
                                                         #unspecified
                                                         (stream_oper_137@trstream
                                                           "stream_junk")
                                                         (cons (access_stream_157@trstream
                                                                 (caml-constr-get-field
                                                                   x11
                                                                   0))
                                                               '()))
                                                       ((x5 (caml-constr-get-field
                                                              x11
                                                              0))
                                                        (caml-constr-get-field
                                                          x10
                                                          1)))))))))
                                    (let ((x11 (divide_term_parsing_216@trstream
                                                 x8)))
                                      (labels
                                        ((staticfail1002
                                           ()
                                           (caml-make-regular-2
                                             #<000b>
                                             (caml-make-regular-2
                                               #a000
                                               (cons (catch_parse_failure_60@trstream
                                                       (caml-make-regular-2
                                                         #unspecified
                                                         (stream_oper_137@trstream
                                                           "stream_peek")
                                                         (cons (access_stream_157@trstream
                                                                 x7)
                                                               '())))
                                                     '())
                                               (3-10-translate_matching_84@match
                                                 (lambda (x12) #<000a>)
                                                 x2
                                                 ((map_118@list x10)
                                                  (caml-constr-get-field
                                                    x11
                                                    0))))
                                             ((x6 (caml-make-regular-1 #t x7))
                                              (caml-constr-get-field x11 1)))))
                                        (if (null? (caml-constr-get-field
                                                     x11
                                                     1))
                                          (caml-make-regular-2
                                            #a000
                                            (cons (caml-make-regular-2
                                                    #unspecified
                                                    (stream_oper_137@trstream
                                                      "stream_peek")
                                                    (cons (access_stream_157@trstream
                                                            x7)
                                                          '()))
                                                  '())
                                            (3-10-translate_matching_84@match
                                              (lambda (x12)
                                                 raise_parse_failure_133@trstream)
                                              x2
                                              ((map_118@list x10)
                                               (caml-constr-get-field x11 0))))
                                          (staticfail1002))))))
                                 ((2)
                                  (labels
                                    ((staticfail1003
                                       ()
                                       (let ((x10 (2-244-add_pat_to_env_200@tr_env
                                                    x7
                                                    (caml-constr-get-field
                                                      (car (caml-constr-get-field
                                                             (car x9)
                                                             0))
                                                      1))))
                                         (caml-make-regular-2
                                           #<000b>
                                           (caml-make-regular-2
                                             #a000
                                             (cons (catch_parse_failure_60@trstream
                                                     (caml-make-regular-2
                                                       #unspecified
                                                       ((x1 x7)
                                                        (caml-constr-get-field
                                                          (car (caml-constr-get-field
                                                                 (car x9)
                                                                 0))
                                                          0))
                                                       (cons (access_stream_157@trstream
                                                               x7)
                                                             '())))
                                                   '())
                                             (3-10-translate_matching_84@match
                                               (lambda (x11) #<000a>)
                                               x2
                                               (cons (caml-make-regular-2
                                                       #f
                                                       (cons (caml-constr-get-field
                                                               (car (caml-constr-get-field
                                                                      (car x9)
                                                                      0))
                                                               1)
                                                             '())
                                                       ((caml-constr-get-field
                                                          x10
                                                          1)
                                                        ((x5 (caml-constr-get-field
                                                               x10
                                                               0))
                                                         (caml-make-regular-2
                                                           #f
                                                           (cdr (caml-constr-get-field
                                                                  (car x9)
                                                                  0))
                                                           (caml-constr-get-field
                                                             (car x9)
                                                             1)))))
                                                     '())))
                                           ((x6 (caml-make-regular-1 #t x7))
                                            (cdr x9))))))
                                    (if (null? (cdr x9))
                                      (let ((x10 (2-244-add_pat_to_env_200@tr_env
                                                   x7
                                                   (caml-constr-get-field
                                                     (car (caml-constr-get-field
                                                            (car x9)
                                                            0))
                                                     1))))
                                        (caml-make-regular-2
                                          #a000
                                          (cons (caml-make-regular-2
                                                  #unspecified
                                                  ((x1 x7)
                                                   (caml-constr-get-field
                                                     (car (caml-constr-get-field
                                                            (car x9)
                                                            0))
                                                     0))
                                                  (cons (access_stream_157@trstream
                                                          x7)
                                                        '()))
                                                '())
                                          (3-10-translate_matching_84@match
                                            (lambda (x11)
                                               raise_parse_failure_133@trstream)
                                            x2
                                            (cons (caml-make-regular-2
                                                    #f
                                                    (cons (caml-constr-get-field
                                                            (car (caml-constr-get-field
                                                                   (car x9)
                                                                   0))
                                                            1)
                                                          '())
                                                    ((caml-constr-get-field
                                                       x10
                                                       1)
                                                     ((x5 (caml-constr-get-field
                                                            x10
                                                            0))
                                                      (caml-make-regular-2
                                                        #f
                                                        (cdr (caml-constr-get-field
                                                               (car x9)
                                                               0))
                                                        (caml-constr-get-field
                                                          (car x9)
                                                          1)))))
                                                  '()))))
                                      (staticfail1003))))
                                 (else
                                  (caml-make-regular-2
                                    #a000
                                    (cons (access_stream_157@trstream x7) '())
                                    ((x5 (caml-make-regular-2
                                           #unspecified
                                           (cons (caml-make-regular-2
                                                   #f
                                                   (caml-constr-get-field
                                                     (car (caml-constr-get-field
                                                            (car x9)
                                                            0))
                                                     0)
                                                   #f)
                                                 '())
                                           x7))
                                     (caml-make-regular-2
                                       #f
                                       (cdr (caml-constr-get-field (car x9) 0))
                                       (caml-constr-get-field
                                         (car x9)
                                         1)))))))))))))
        (caml-make-regular-1
          #u0000
          ((x6 (caml-make-regular-2
                 #unspecified
                 '(#("%stream" #f #f))
                 x3))
           x4)))))
)

