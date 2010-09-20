;; Le module 
(module
  __caml_printexc
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
    (f_158@printexc x1)
    (2-163-f_158@printexc x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (f_158@printexc x1)
    (lambda (x2) (2-163-f_158@printexc x1 x2)))
 (define (2-163-f_158@printexc x1 x2)
    (with-handler
      (lambda (x3)
         (begin
           (flush std_out_112@io)
           (begin
             (let ((x4 x3))
               (labels
                 ((staticfail1001
                    ()
                    (begin
                      (prerr_string_235@io "Uncaught exception ")
                      (prerr_string_235@io (string-of-exception x4)))))
                 (case (caml-extensible-constr-tag x4)
                   ((Out_of_memory_1@exc)
                    (prerr_string_235@io "Out of memory"))
                   ((Match_failure_1@builtin)
                    (begin
                      (prerr_string_235@io
                        "Pattern matching failed, file ")
                      (begin
                        (prerr_string_235@io
                          (caml-constr-get-field x4 0))
                        (begin
                          (prerr_string_235@io ", chars ")
                          (begin
                            (prerr_int_158@io (caml-constr-get-field x4 1))
                            (begin
                              (prerr_string_235@io "-")
                              (prerr_int_158@io
                                (caml-constr-get-field x4 2))))))))
                   ((Failure_3@exc)
                    (begin
                      (prerr_string_235@io "Evaluation failed : ")
                      (prerr_string_235@io
                        (caml-constr-get-field x4 0))))
                   ((Invalid_argument_2@exc)
                    (begin
                      (prerr_string_235@io "Invalid argument : ")
                      (prerr_string_235@io
                        (caml-constr-get-field x4 0))))
                   ((Sys_error_1@sys)
                    (begin
                      (prerr_string_235@io "System call failed : ")
                      (prerr_string_235@io
                        (caml-constr-get-field x4 0))))
                   (else (staticfail1001)))))
             (begin
               (prerr_char_240@io #\newline)
               (exit_246@io 2)))))
      (unwind-protect
        (begin (push-exception-handler) (x1 x2))
        (pop-exception-handler))))
)

