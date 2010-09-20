;; Le module 
(module
  __caml_io
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
    std_in_43@io
    std_out_112@io
    std_err_241@io
    stdin_193@io
    stdout_127@io
    stderr_46@io
    (exit_246@io x1)
    (open_in_gen_187@io x1)
    (3-49-open_in_gen_187@io x1 x2 x3)
    open_in_150@io
    open_in_bin_161@io
    (input_26@io x1)
    (4-66-input_26@io x1 x2 x3 x4)
    (fast_really_input_45@io x1)
    (4-208-fast_really_input_45@io x1 x2 x3 x4)
    (really_input_190@io x1)
    (4-14-really_input_190@io x1 x2 x3 x4)
    (read_line_228@io x1)
    (read_int_41@io x1)
    (read_float_120@io x1)
    (open_out_gen_252@io x1)
    (3-76-open_out_gen_252@io x1 x2 x3)
    open_out_142@io
    open_out_bin_83@io
    (output_249@io x1)
    (4-119-output_249@io x1 x2 x3 x4)
    (output_string_156@io x1)
    (2-235-output_string_156@io x1 x2)
    print_char_82@io
    print_string_98@io
    (print_int_72@io x1)
    (print_float_250@io x1)
    (print_endline_197@io x1)
    (print_newline_91@io x1)
    prerr_char_240@io
    prerr_string_235@io
    (prerr_int_158@io x1)
    (prerr_float_62@io x1)
    (prerr_endline_232@io x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define std_in_43@io (open_descriptor 0))
  (begin
    (define std_out_112@io (open_descriptor 1))
    (define std_err_241@io (open_descriptor 2))))

(begin
  (define stdin_193@io std_in_43@io)
  (begin
    (define stdout_127@io std_out_112@io)
    (define stderr_46@io std_err_241@io)))

(define (exit_246@io x1)
  (begin
    (flush std_out_112@io)
    (begin (flush std_err_241@io) (sys_exit x1))))


(begin
  (define (open_in_gen_187@io x1)
    (lambda (x2)
       (lambda (x3) (3-49-open_in_gen_187@io x1 x2 x3))))
 (define (3-49-open_in_gen_187@io x1 x2 x3)
    (open_descriptor (sys_open x3 x1 x2)))
)

(begin
  (define open_in_150@io
    ((open_in_gen_187@io '(#f #<0009>)) 0))
 (define open_in_bin_161@io
    ((open_in_gen_187@io '(#f #<0008>)) 0))
)

(begin
  (define (input_26@io x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4) (4-66-input_26@io x1 x2 x3 x4)))))
 (define (4-66-input_26@io x1 x2 x3 x4)
    (if (or (<fx x4 0)
            (or (<fx x3 0)
                (>fx (+fx x3 x4) (string-length x2))))
      (invalid_arg_209@exc "input")
      (input x1 x2 x3 x4)))
)

(begin
  (define (fast_really_input_45@io x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-208-fast_really_input_45@io x1 x2 x3 x4)))))
 (define (4-208-fast_really_input_45@io x1 x2 x3 x4)
    (if (<=fx x4 0)
      #f
      (let ((x5 (input x1 x2 x3 x4)))
        (labels
          ((staticfail1001
             ()
             (4-208-fast_really_input_45@io
               x1
               x2
               (+fx x3 x5)
               (-fx x4 x5))))
          (let ((g1002 x5))
            (cond ((=fx g1002 0) (caml-raise 'End_of_file_1@io))
                  (else (staticfail1001))))))))
)

(begin
  (define (really_input_190@io x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-14-really_input_190@io x1 x2 x3 x4)))))
 (define (4-14-really_input_190@io x1 x2 x3 x4)
    (if (or (<fx x4 0)
            (or (<fx x3 0)
                (>fx (+fx x3 x4) (string-length x2))))
      (invalid_arg_209@exc "really_input")
      (4-208-fast_really_input_45@io x1 x2 x3 x4)))
)

(define (read_line_228@io x1)
  (begin
    (flush std_out_112@io)
    (input_line std_in_43@io)))


(define (read_int_41@io x1)
  (int_of_string (read_line_228@io #f)))


(define (read_float_120@io x1)
  (float_of_string (read_line_228@io #f)))


(begin
  (define (open_out_gen_252@io x1)
    (lambda (x2)
       (lambda (x3) (3-76-open_out_gen_252@io x1 x2 x3))))
 (define (3-76-open_out_gen_252@io x1 x2 x3)
    (open_descriptor (sys_open x3 x1 x2)))
)

(begin
  (define open_out_142@io
    ((open_out_gen_252@io '(#t #<0006> #a000 #<0009>))
     (+fx s_irall_56@sys s_iwall_219@sys)))
 (define open_out_bin_83@io
    ((open_out_gen_252@io '(#t #<0006> #a000 #<0008>))
     (+fx s_irall_56@sys s_iwall_219@sys)))
)

(begin
  (define (output_249@io x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4) (4-119-output_249@io x1 x2 x3 x4)))))
 (define (4-119-output_249@io x1 x2 x3 x4)
    (if (or (<fx x4 0)
            (or (<fx x3 0)
                (>fx (+fx x3 x4) (string-length x2))))
      (invalid_arg_209@exc "output")
      (output x1 x2 x3 x4)))
)

(begin
  (define (output_string_156@io x1)
    (lambda (x2) (2-235-output_string_156@io x1 x2)))
 (define (2-235-output_string_156@io x1 x2)
    (output x1 x2 0 (string-length x2)))
)

(define print_char_82@io
  ((lambda (x1) (lambda (x2) (output_char x1 x2)))
   std_out_112@io))


(define print_string_98@io
  (output_string_156@io std_out_112@io))


(define (print_int_72@io x1)
  (print_string_98@io (string_of_int_188@int x1)))


(define (print_float_250@io x1)
  (print_string_98@io
    (string_of_float_111@float x1)))


(define (print_endline_197@io x1)
  (begin
    (print_string_98@io x1)
    (print_char_82@io #\newline)))


(define (print_newline_91@io x1)
  (begin
    (print_char_82@io #\newline)
    (flush std_out_112@io)))


(define prerr_char_240@io
  ((lambda (x1) (lambda (x2) (output_char x1 x2)))
   std_err_241@io))


(define prerr_string_235@io
  (output_string_156@io std_err_241@io))


(define (prerr_int_158@io x1)
  (prerr_string_235@io (string_of_int_188@int x1)))


(define (prerr_float_62@io x1)
  (prerr_string_235@io
    (string_of_float_111@float x1)))


(define (prerr_endline_232@io x1)
  (begin
    (prerr_string_235@io x1)
    (begin
      (prerr_char_240@io #\newline)
      (flush std_err_241@io))))


