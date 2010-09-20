;; Le module 
(module
  __caml_emit_phr
  (library camloo-runtime)
  (import
    __caml_instruct
    __caml_buffcode
    __caml_emitcode
    __caml_reloc
    __caml_labels)
  (export
    abs_out_position_239@emit_phr
    compiled_phrase_index_104@emit_phr
    (start_emit_phrase_36@emit_phr x1)
    (emit_phrase_15@emit_phr x1)
    (3-69-emit_phrase_15@emit_phr x1 x2 x3)
    (end_emit_phrase_38@emit_phr x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define abs_out_position_239@emit_phr
  (make-cell 0))


(define compiled_phrase_index_104@emit_phr
  (make-cell '()))


(define (start_emit_phrase_36@emit_phr x1)
  (begin
    (output_int x1 0)
    (begin
      (cell-set! abs_out_position_239@emit_phr 4)
      (cell-set!
        compiled_phrase_index_104@emit_phr
        '()))))


(begin
  (define (emit_phrase_15@emit_phr x1)
    (lambda (x2)
       (lambda (x3)
          (3-69-emit_phrase_15@emit_phr x1 x2 x3))))
 (define (3-69-emit_phrase_15@emit_phr x1 x2 x3)
    (begin
      (reset_204@reloc #f)
      (begin
        (init_out_code_133@buffcode #f)
        (begin
          (reset_label_table_229@labels #f)
          (begin
            (let ((x4 x3))
              (labels
                ((staticfail1000
                   ()
                   (let ((g1001 (caml-constr-get-field x4 0)))
                     (cond ((eq? g1001 #f)
                            (begin
                              (emit_178@emitcode '(#(0 #<0015>)))
                              (begin
                                (emit_178@emitcode (caml-constr-get-field x3 2))
                                (begin
                                  (emit_178@emitcode '(#(0 #<0014>)))
                                  (emit_178@emitcode
                                    (caml-constr-get-field x3 1))))))
                           ((eq? g1001 #t)
                            (begin
                              (emit_178@emitcode (caml-constr-get-field x3 1))
                              (begin
                                (emit_178@emitcode '(#(0 #<0015>)))
                                (begin
                                  (emit_178@emitcode
                                    (caml-constr-get-field x3 2))
                                  (emit_178@emitcode '(#(0 #<0014>)))))))
                           (else #f)))))
                (if (null? (caml-constr-get-field x4 2))
                  (emit_178@emitcode (caml-constr-get-field x3 1))
                  (staticfail1000))))
            (begin
              ((((output_249@io x1)
                 (cell-ref out_buffer_163@buffcode))
                0)
               (cell-ref out_position_239@buffcode))
              (begin
                (cell-set!
                  compiled_phrase_index_104@emit_phr
                  (cons (caml-make-regular-4
                          #f
                          (cell-ref abs_out_position_239@emit_phr)
                          (cell-ref out_position_239@buffcode)
                          (get_info_0@reloc #f)
                          x2)
                        (cell-ref compiled_phrase_index_104@emit_phr)))
                (cell-set!
                  abs_out_position_239@emit_phr
                  (+fx (cell-ref abs_out_position_239@emit_phr)
                       (cell-ref out_position_239@buffcode))))))))))
)

(define (end_emit_phrase_38@emit_phr x1)
  (begin
    (extern_val
      x1
      (cell-ref compiled_phrase_index_104@emit_phr))
    (begin
      (cell-set!
        compiled_phrase_index_104@emit_phr
        '())
      (begin
        (seek_out x1 0)
        (output_int
          x1
          (cell-ref abs_out_position_239@emit_phr))))))


