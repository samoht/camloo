;; Le module 
(module
  __caml_queue
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
    (new_27@queue x1)
    (clear_94@queue x1)
    (add_6@queue x1)
    (2-104-add_6@queue x1 x2)
    (peek_208@queue x1)
    (take_26@queue x1)
    (length_aux_116@queue x1)
    (length_175@queue x1)
    (iter_aux_34@queue x1)
    (2-236-iter_aux_34@queue x1 x2)
    (iter_219@queue x1)
    (2-102-iter_219@queue x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (new_27@queue x1)
  (caml-make-regular-2 #f #f #f))


(define (clear_94@queue x1)
  (begin
    (caml-constr-set-field! x1 0 #f)
    (caml-constr-set-field! x1 1 #f)))


(begin
  (define (add_6@queue x1)
    (lambda (x2) (2-104-add_6@queue x1 x2)))
 (define (2-104-add_6@queue x1 x2)
    (labels
      ((staticfail1000
         ()
         (caml-raise
           '#("Mlib/queue.ml"
              317
              545
              Match_failure_1@builtin
              ()))))
      (labels
        ((staticfail1001
           ()
           (case (if (caml-constant-constr?
                       (caml-constr-get-field x2 1))
                   -1
                   (caml-regular-constr-tag
                     (caml-constr-get-field x2 1)))
             ((2)
              (let ((x3 (caml-constr-get-field x2 1))
                    (x4 (cell-ref
                          (caml-constr-get-field
                            (caml-constr-get-field x2 1)
                            1))))
                (let ((x5 (caml-make-regular-2 #t x1 (make-cell #f))))
                  (begin
                    (cell-set!
                      (caml-constr-get-field
                        (caml-constr-get-field x2 1)
                        1)
                      x5)
                    (caml-constr-set-field! x2 1 x5)))))
             (else (staticfail1000)))))
        (let ((g1003 (caml-constr-get-field x2 0)))
          (cond ((eq? g1003 #f)
                 (let ((g1004 (caml-constr-get-field x2 1)))
                   (cond ((eq? g1004 #f)
                          (let ((x3 (caml-constr-get-field x2 0))
                                (x4 (caml-constr-get-field x2 1)))
                            (let ((x5 (caml-make-regular-2
                                        #t
                                        x1
                                        (make-cell #f))))
                              (begin
                                (caml-constr-set-field! x2 0 x5)
                                (caml-constr-set-field! x2 1 x5)))))
                         (else (staticfail1001)))))
                (else (staticfail1001)))))))
)

(define (peek_208@queue x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (let ((g1005 x2))
      (cond ((eq? g1005 #f) (caml-raise 'Empty_1@queue))
            (else
             (let ((x3 (cell-ref (caml-constr-get-field x2 1))))
               (caml-constr-get-field x2 0)))))))


(define (take_26@queue x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (let ((g1006 x2))
      (cond ((eq? g1006 #f) (caml-raise 'Empty_1@queue))
            (else
             (let ((x3 (cell-ref (caml-constr-get-field x2 1))))
               (begin
                 (caml-constr-set-field! x1 0 x3)
                 (begin
                   (let ((x4 x3))
                     (labels
                       ((staticfail1002 () #f))
                       (let ((g1007 x4))
                         (cond ((eq? g1007 #f) (caml-constr-set-field! x1 1 #f))
                               (else (staticfail1002))))))
                   (caml-constr-get-field x2 0)))))))))


(define (length_aux_116@queue x1)
  (let ((g1008 x1))
    (cond ((eq? g1008 #f) 0)
          (else
           (let ((x2 (cell-ref (caml-constr-get-field x1 1))))
             (+fx (length_aux_116@queue x2) 1))))))


(define (length_175@queue x1)
  (length_aux_116@queue
    (caml-constr-get-field x1 0)))


(begin
  (define (iter_aux_34@queue x1)
    (lambda (x2) (2-236-iter_aux_34@queue x1 x2)))
 (define (2-236-iter_aux_34@queue x1 x2)
    (let ((g1009 x2))
      (cond ((eq? g1009 #f) #f)
            (else
             (let ((x3 (cell-ref (caml-constr-get-field x2 1))))
               (begin
                 (x1 (caml-constr-get-field x2 0))
                 (2-236-iter_aux_34@queue x1 x3)))))))
)

(begin
  (define (iter_219@queue x1)
    (lambda (x2) (2-102-iter_219@queue x1 x2)))
 (define (2-102-iter_219@queue x1 x2)
    (2-236-iter_aux_34@queue
      x1
      (caml-constr-get-field x2 0)))
)

