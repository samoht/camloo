;; Le module 
(module
  __caml_misc
  (library camloo-runtime)
  (import __caml_config)
  (export
    (fatal_error_193@misc x1)
    toplevel_224@misc
    (print_begline_186@misc x1)
    (prerr_begline_213@misc x1)
    (prerr_endline2_160@misc x1)
    load_path_99@misc
    (file_exists_172@misc x1)
    (cannot_find_218@misc x1)
    (find_in_path_8@misc x1)
    rollback_buffer_5@misc
    (reset_rollback_7@misc x1)
    (add_rollback_29@misc x1)
    (rollback_156@misc x1)
    (remove_file_255@misc x1)
    (list_filter_194@misc x1)
    (2-128-list_filter_194@misc x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (fatal_error_193@misc x1)
  (caml-raise
    (caml-make-static-extensible-1 'Zinc_1@misc x1)))


(define toplevel_224@misc (make-cell #f))

(define (print_begline_186@misc x1)
  (begin
    (if (cell-ref toplevel_224@misc)
      (print_string_98@io
        toplevel_output_prompt_179@config)
      (print_string_98@io
        batch_output_prompt_200@config))
    (print_string_98@io x1)))


(define (prerr_begline_213@misc x1)
  (begin
    (if (cell-ref toplevel_224@misc)
      (prerr_string_235@io
        toplevel_error_prompt_60@config)
      (prerr_string_235@io
        batch_error_prompt_64@config))
    (prerr_string_235@io x1)))


(define (prerr_endline2_160@misc x1)
  (begin
    (prerr_endline_232@io x1)
    (prerr_endline_232@io "")))


(define load_path_99@misc (make-cell '()))

(define (file_exists_172@misc x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1001 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Sys_error_1@sys) #f)
           (else (staticfail1001)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (begin (sys_close (sys_open x1 '(#f) 0)) #t))
      (pop-exception-handler))))


(define (cannot_find_218@misc x1)
  (begin
    (prerr_begline_213@misc " Cannot find file ")
    (begin
      (prerr_endline_232@io x1)
      (caml-raise 'Toplevel_2@misc))))


(define (find_in_path_8@misc x1)
  (if (file_exists_172@misc x1)
    x1
    (if (is_absolute_255@filename x1)
      (cannot_find_218@misc x1)
      (letrec ((x2 (lambda (x3)
                      (if (null? x3)
                        (cannot_find_218@misc x1)
                        (let ((x4 ((concat_228@filename (car x3)) x1)))
                          (if (file_exists_172@misc x4) x4 (x2 (cdr x3))))))))
        (x2 (cell-ref load_path_99@misc))))))


(define rollback_buffer_5@misc (make-cell '()))

(define (reset_rollback_7@misc x1)
  (cell-set! rollback_buffer_5@misc '()))


(define (add_rollback_29@misc x1)
  (cell-set!
    rollback_buffer_5@misc
    (cons x1 (cell-ref rollback_buffer_5@misc))))


(define (rollback_156@misc x1)
  (let ((x2 (cell-ref rollback_buffer_5@misc)))
    (if (null? x2)
      #f
      (begin
        ((car x2) #f)
        (begin
          (cell-set! rollback_buffer_5@misc (cdr x2))
          (rollback_156@misc #f))))))


(define (remove_file_255@misc x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1003 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Sys_error_1@sys) #f)
           (else (staticfail1003)))))
    (unwind-protect
      (begin (push-exception-handler) (sys_remove x1))
      (pop-exception-handler))))


(begin
  (define (list_filter_194@misc x1)
    (lambda (x2) (2-128-list_filter_194@misc x1 x2)))
 (define (2-128-list_filter_194@misc x1 x2)
    (let ((x3 (((it_list_7@list
                  (lambda (x3)
                     (lambda (x4) (if (x1 x4) (cons x4 x3) x3))))
                '())
               x2)))
      (rev_210@list x3)))
)

