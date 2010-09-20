;; Le module 
(module
  __caml_modules
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_errors)
  (export
    (name_of_module_198@modules x1)
    (values_of_module_199@modules x1)
    (constrs_of_module_249@modules x1)
    (labels_of_module_207@modules x1)
    (types_of_module_132@modules x1)
    module_table_28@modules
    (new_module_72@modules x1)
    use_extended_zi_91@modules
    (read_module_102@modules x1)
    ever_opened_modules_106@modules
    (get_ever_opened_modules_184@modules x1)
    (load_module_3@modules x1)
    (find_module_27@modules x1)
    (kill_module_137@modules x1)
    default_used_modules_33@modules
    defined_module_128@modules
    used_modules_84@modules
    (start_compiling_interface_242@modules x1)
    (start_compiling_implementation_91@modules x1)
    (2-158-start_compiling_implementation_91@modules
      x1
      x2)
    (compiled_module_name_64@modules x1)
    (defined_global_60@modules x1)
    (2-131-defined_global_60@modules x1 x2)
    (new_type_stamp_250@modules x1)
    (new_exc_stamp_188@modules x1)
    (add_global_info_9@modules x1)
    (2-86-add_global_info_9@modules x1 x2)
    add_value_24@modules
    add_constr_192@modules
    add_label_68@modules
    add_type_46@modules
    (find_desc_92@modules x1)
    (2-171-find_desc_92@modules x1 x2)
    find_value_desc_91@modules
    find_constr_desc_181@modules
    find_label_desc_109@modules
    find_type_desc_221@modules
    (type_descr_of_type_constr_139@modules x1)
    (write_compiled_interface_99@modules x1)
    (flush_module_cache_10@modules x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (name_of_module_198@modules x1)
    (caml-constr-get-field x1 0))
 (begin
    (define (values_of_module_199@modules x1)
      (caml-constr-get-field x1 1))
   (begin
      (define (constrs_of_module_249@modules x1)
        (caml-constr-get-field x1 2))
     (begin
        (define (labels_of_module_207@modules x1)
          (caml-constr-get-field x1 3))
       (define (types_of_module_132@modules x1)
          (caml-constr-get-field x1 4))
))))

(define module_table_28@modules
  (new_27@hashtbl 37))


(define (new_module_72@modules x1)
  (let ((x2 (caml-make-regular
              #f
              8
              x1
              (new_27@hashtbl 17)
              (new_27@hashtbl 13)
              (new_27@hashtbl 11)
              (new_27@hashtbl 7)
              0
              0
              #f)))
    (begin
      (((add_6@hashtbl module_table_28@modules) x1) x2)
      x2)))


(define use_extended_zi_91@modules
  (make-cell #f))


(define (read_module_102@modules x1)
  (let ((x2 (open_in_bin_161@io x1)))
    (with-handler
      (lambda (x3)
         (labels
           ((staticfail1001 () (caml-raise x3)))
           (case (caml-extensible-constr-tag x3)
             ((Failure_3@exc End_of_file_1@io)
              (begin
                (close_in x2)
                (begin
                  (prerr_begline_213@misc
                    " Corrupted compiled interface file ")
                  (begin
                    (prerr_endline_232@io x1)
                    (caml-raise 'Toplevel_2@misc)))))
             (else (staticfail1001)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (let ((x3 (intern_val x2)))
            (begin
              (close_in x2)
              (begin (caml-constr-set-field! x3 7 #t) x3))))
        (pop-exception-handler)))))


(define ever_opened_modules_106@modules
  (make-cell '()))


(define (get_ever_opened_modules_184@modules x1)
  (cell-ref ever_opened_modules_106@modules))


(define (load_module_3@modules x1)
  (let ((x2 (find_in_path_8@misc ((^_54@string x1) ".zi"))))
    (let ((x3 (if (and (cell-ref use_extended_zi_91@modules)
                       (file_exists_172@misc ((^_54@string x2) "x")))
                ((^_54@string x2) "x")
                x2)))
      (begin
        (cell-set!
          ever_opened_modules_106@modules
          (cons (caml-make-regular-2 #f x1 x3)
                (cell-ref ever_opened_modules_106@modules)))
        (read_module_102@modules x3)))))


(define (find_module_27@modules x1)
  (let ((x2 (basename_226@filename x1)))
    (with-handler
      (lambda (x3)
         (labels
           ((staticfail1003 () (caml-raise x3)))
           (case (caml-extensible-constr-tag x3)
             ((Not_found_4@exc)
              (let ((x4 (load_module_3@modules x1)))
                (begin
                  (((add_6@hashtbl module_table_28@modules) x2) x4)
                  x4)))
             (else (staticfail1003)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          ((find_75@hashtbl module_table_28@modules) x2))
        (pop-exception-handler)))))


(define (kill_module_137@modules x1)
  ((remove_141@hashtbl module_table_28@modules) x1))


(define default_used_modules_33@modules
  (make-cell '()))


(begin
  (define defined_module_128@modules
    (make-cell (new_module_72@modules "")))
 (define used_modules_84@modules (make-cell '())))

(define (start_compiling_interface_242@modules x1)
  (begin
    (cell-set!
      defined_module_128@modules
      (new_module_72@modules x1))
    (cell-set!
      used_modules_84@modules
      ((map_118@list find_module_27@modules)
       (cell-ref default_used_modules_33@modules)))))


(begin
  (define (start_compiling_implementation_91@modules x1)
    (lambda (x2)
       (2-158-start_compiling_implementation_91@modules
         x1
         x2)))
 (define (2-158-start_compiling_implementation_91@modules
           x1
           x2)
    (begin
      (start_compiling_interface_242@modules x1)
      (begin
        (caml-constr-set-field!
          (cell-ref defined_module_128@modules)
          5
          (caml-constr-get-field x2 5))
        (caml-constr-set-field!
          (cell-ref defined_module_128@modules)
          6
          (caml-constr-get-field x2 6)))))
)

(define (compiled_module_name_64@modules x1)
  (caml-constr-get-field
    (cell-ref defined_module_128@modules)
    0))


(begin
  (define (defined_global_60@modules x1)
    (lambda (x2)
       (2-131-defined_global_60@modules x1 x2)))
 (define (2-131-defined_global_60@modules x1 x2)
    (caml-make-regular-2
      #f
      (caml-make-regular-2
        #f
        (compiled_module_name_64@modules #f)
        x1)
      x2))
)

(define (new_type_stamp_250@modules x1)
  (let ((x2 (+fx (caml-constr-get-field
                   (cell-ref defined_module_128@modules)
                   5)
                 1)))
    (begin
      (caml-constr-set-field!
        (cell-ref defined_module_128@modules)
        5
        x2)
      x2)))


(define (new_exc_stamp_188@modules x1)
  (let ((x2 (+fx (caml-constr-get-field
                   (cell-ref defined_module_128@modules)
                   6)
                 1)))
    (begin
      (caml-constr-set-field!
        (cell-ref defined_module_128@modules)
        6
        x2)
      x2)))


(begin
  (define (add_global_info_9@modules x1)
    (lambda (x2)
       (2-86-add_global_info_9@modules x1 x2)))
 (define (2-86-add_global_info_9@modules x1 x2)
    (let ((x3 (x1 (cell-ref defined_module_128@modules))))
      (begin
        (if (cell-ref toplevel_224@misc)
          (add_rollback_29@misc
            (lambda (x4)
               ((remove_141@hashtbl x3)
                (caml-constr-get-field
                  (caml-constr-get-field x2 0)
                  1))))
          #f)
        (((add_6@hashtbl x3)
          (caml-constr-get-field
            (caml-constr-get-field x2 0)
            1))
         x2))))
)

(begin
  (define add_value_24@modules
    (add_global_info_9@modules
      values_of_module_199@modules))
 (begin
    (define add_constr_192@modules
      (add_global_info_9@modules
        constrs_of_module_249@modules))
   (begin
      (define add_label_68@modules
        (add_global_info_9@modules
          labels_of_module_207@modules))
     (define add_type_46@modules
        (add_global_info_9@modules
          types_of_module_132@modules))
)))

(begin
  (define (find_desc_92@modules x1)
    (lambda (x2) (2-171-find_desc_92@modules x1 x2)))
 (define (2-171-find_desc_92@modules x1 x2)
    (case (caml-regular-constr-tag x2)
      ((2)
       (with-handler
         (lambda (x3)
            (labels
              ((staticfail1005 () (caml-raise x3)))
              (case (caml-extensible-constr-tag x3)
                ((Not_found_4@exc)
                 (caml-raise 'Desc_not_found_1@modules))
                (else (staticfail1005)))))
         (unwind-protect
           (begin
             (push-exception-handler)
             ((find_75@hashtbl
                (x1 (find_module_27@modules
                      (caml-constr-get-field
                        (caml-constr-get-field x2 0)
                        0))))
              (caml-constr-get-field
                (caml-constr-get-field x2 0)
                1)))
           (pop-exception-handler))))
      (else
       (with-handler
         (lambda (x3)
            (labels
              ((staticfail1009 () (caml-raise x3)))
              (case (caml-extensible-constr-tag x3)
                ((Not_found_4@exc)
                 (letrec ((x4 (lambda (x5)
                                 (if (null? x5)
                                   (caml-raise 'Desc_not_found_1@modules)
                                   (with-handler
                                     (lambda (x6)
                                        (labels
                                          ((staticfail1011 () (caml-raise x6)))
                                          (case (caml-extensible-constr-tag x6)
                                            ((Not_found_4@exc) (x4 (cdr x5)))
                                            (else (staticfail1011)))))
                                     (unwind-protect
                                       (begin
                                         (push-exception-handler)
                                         ((find_75@hashtbl (x1 (car x5)))
                                          (caml-constr-get-field x2 0)))
                                       (pop-exception-handler)))))))
                   (x4 (cell-ref used_modules_84@modules))))
                (else (staticfail1009)))))
         (unwind-protect
           (begin
             (push-exception-handler)
             ((find_75@hashtbl
                (x1 (cell-ref defined_module_128@modules)))
              (caml-constr-get-field x2 0)))
           (pop-exception-handler))))))
)

(begin
  (define find_value_desc_91@modules
    (find_desc_92@modules
      values_of_module_199@modules))
 (begin
    (define find_constr_desc_181@modules
      (find_desc_92@modules
        constrs_of_module_249@modules))
   (begin
      (define find_label_desc_109@modules
        (find_desc_92@modules
          labels_of_module_207@modules))
     (define find_type_desc_221@modules
        (find_desc_92@modules
          types_of_module_132@modules))
)))

(define (type_descr_of_type_constr_139@modules x1)
  (letrec ((x2 (lambda (x3)
                  (if (null? x3)
                    (caml-raise 'Desc_not_found_1@modules)
                    (if (tree_equal
                          (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field (car x3) 1)
                                0)
                              1)
                            0)
                          (caml-constr-get-field
                            (caml-constr-get-field x1 1)
                            0))
                      (car x3)
                      (x2 (cdr x3)))))))
    (x2 ((find_all_241@hashtbl
           (types_of_module_132@modules
             (find_module_27@modules
               (caml-constr-get-field
                 (caml-constr-get-field x1 0)
                 0))))
         (caml-constr-get-field
           (caml-constr-get-field x1 0)
           1)))))


(define (write_compiled_interface_99@modules x1)
  (extern_val
    x1
    (cell-ref defined_module_128@modules)))


(define (flush_module_cache_10@modules x1)
  (let ((x2 ((map_118@list
               (lambda (x2) (caml-constr-get-field x2 0)))
             (cell-ref used_modules_84@modules))))
    (begin
      ((do_table_147@hashtbl
         (lambda (x3)
            (lambda (x4)
               (if (caml-constr-get-field x4 7)
                 (kill_module_137@modules x3)
                 #f))))
       module_table_28@modules)
      (cell-set!
        used_modules_84@modules
        ((map_118@list find_module_27@modules) x2)))))


