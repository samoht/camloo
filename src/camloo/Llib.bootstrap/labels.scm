;; Le module 
(module
  __caml_labels
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_instruct
    __caml_buffcode)
  (export
    label_table_246@labels
    (reset_label_table_229@labels x1)
    (extend_label_table_197@labels x1)
    (define_label_232@labels x1)
    (out_label_with_orig_230@labels x1)
    (2-131-out_label_with_orig_230@labels x1 x2)
    (out_label_131@labels x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define label_table_246@labels (make-cell #f))

(define (reset_label_table_229@labels x1)
  (begin
    (cell-set!
      label_table_246@labels
      ((make_vect_185@vect 16) '#(() #t)))
    #f))


(define (extend_label_table_197@labels x1)
  (let ((x2 (let ((g1003 (cell-ref label_table_246@labels)))
              (if g1003 (vector-length g1003) 0))))
    (let ((x3 ((make_vect_185@vect (*fx (+fx (/fx x1 x2) 1) x2))
               '#(() #t))))
      (begin
        (let ((stop1001 (-fx x2 1)))
          (let for1000 ((i4 0))
            (if (<=fx i4 stop1001)
              (begin
                (((vect_assign_169@vect x3) i4)
                 ((vect_item_124@vect
                    (cell-ref label_table_246@labels))
                  i4))
                (for1000 (+fx i4 1)))
              (unspecified))))
        (begin (cell-set! label_table_246@labels x3) #f)))))


(define (define_label_232@labels x1)
  (begin
    (if (>=fx x1
              (let ((g1004 (cell-ref label_table_246@labels)))
                (if g1004 (vector-length g1004) 0)))
      (extend_label_table_197@labels x1)
      #f)
    (let ((x2 ((vect_item_124@vect
                 (cell-ref label_table_246@labels))
               x1)))
      (case (caml-regular-constr-tag x2)
        ((1)
         (fatal_error_193@misc
           "define_label : already defined"))
        (else
         (let ((x3 (cell-ref out_position_239@buffcode)))
           (begin
             (((vect_assign_169@vect
                 (cell-ref label_table_246@labels))
               x1)
              (caml-make-regular-1 #f x3))
             (let ((x4 (caml-constr-get-field x2 0)))
               (labels
                 ((staticfail1002
                    ()
                    (begin
                      ((do_list_18@list
                         (lambda (x5)
                            (begin
                              (cell-set!
                                out_position_239@buffcode
                                (caml-constr-get-field x5 0))
                              (out_short_156@buffcode
                                (-fx x3 (caml-constr-get-field x5 1))))))
                       (caml-constr-get-field x2 0))
                      (cell-set! out_position_239@buffcode x3))))
                 (if (null? x4) #f (staticfail1002)))))))))))


(begin
  (define (out_label_with_orig_230@labels x1)
    (lambda (x2)
       (2-131-out_label_with_orig_230@labels x1 x2)))
 (define (2-131-out_label_with_orig_230@labels x1 x2)
    (begin
      (if (eq? x2 Nolabel_4@instruct)
        (fatal_error_193@misc
          "out_label: undefined label")
        #f)
      (begin
        (if (>=fx x2
                  (let ((g1005 (cell-ref label_table_246@labels)))
                    (if g1005 (vector-length g1005) 0)))
          (extend_label_table_197@labels x2)
          #f)
        (let ((x3 ((vect_item_124@vect
                     (cell-ref label_table_246@labels))
                   x2)))
          (case (caml-regular-constr-tag x3)
            ((1)
             (out_short_156@buffcode
               (-fx (caml-constr-get-field x3 0) x1)))
            (else
             (begin
               (((vect_assign_169@vect
                   (cell-ref label_table_246@labels))
                 x2)
                (caml-make-regular-1
                  #t
                  (cons (caml-make-regular-2
                          #f
                          (cell-ref out_position_239@buffcode)
                          x1)
                        (caml-constr-get-field x3 0))))
               (out_short_156@buffcode 0))))))))
)

(define (out_label_131@labels x1)
  (2-131-out_label_with_orig_230@labels
    (cell-ref out_position_239@buffcode)
    x1))


