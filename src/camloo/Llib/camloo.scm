;* Copyright (C) 1994-2010 INRIA
;*
;* This program is free software; you can redistribute it and/or modify
;* it under the terms of the GNU General Public License as published by
;* the Free Software Foundation; version 2 of the License.
;*
;* This program is distributed in the hope that it will be useful,
;* but WITHOUT ANY WARRANTY; without even the implied warranty of
;* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;* GNU General Public License for more details.

;*---------------------------------------------------------------------*/
;*    Le module                                                        */
;*---------------------------------------------------------------------*/
(module camloo
		(main main)
		(library camloo-runtime)
		(import init
				lib_module_list
				module
				generate
				Llambda
				optimize-ref
				Ldefine
				__caml_main))

;*---------------------------------------------------------------------*/
;*    *output*                                                         */
;*---------------------------------------------------------------------*/
(define *output*      (current-output-port))
(define *output-name* '())
(define *trace*       0)

;*---------------------------------------------------------------------*/
;*    main ...                                                         */
;*---------------------------------------------------------------------*/
#;(let ((x1 ((f_158@printexc main_109@main)
           command_line_240@sys)))
  0)

(define (main argv)
  (with-trace 2 'MAIN
  (parse-args! (cdr argv))
  (let ((mlopt (if *zi-mode*
				   (cons "camloo" (append (string-split *mlopt*) (list *in*)))
				   (cons "camloo" (append (string-split *mlopt*) (list "-dump" *in*))))))
	(if *stop*
		((f_158@printexc main_109@main) (list->vector mlopt))
		(begin
		  ((f_158@printexc main_109@main) (list->vector mlopt))
		  (unwind-protect
			 (begin
				(start-io!)
				(read-afile!)
				(mark-as-remember-module! *module-str*)
;				(for-each (lambda (m)
;							 (mark-as-remember-module! m))
;						  *lib-module-list*)
				(Load)
				(trace-item "Load OK"))
			 (close-io!))
		  (unwind-protect
		   (begin
			  (start-io!)
			  (Llambdas)
			  (write-current-pragma)
			  (trace-item "Lambda OK")
			  ;(delete-file *lam*)
			  )
		  (close-io!)))))))

;*---------------------------------------------------------------------*/
;*    Llambdas ...                                                     */
;*---------------------------------------------------------------------*/
(define (Llambdas)
  (if (input-port? *pin*)
	  (let loop ((exp (read *pin*)))
		(if (eof-object? exp)
			(begin
			   (if (> *optim* 0)
				   (optimize-ref (get-all-exp)))
			   (generate-module!))
			(let ((exp (match-case exp
						  ((rec ?exp)
						   (set! rec-flag? #t)
						   (Llambda exp #t '() #f #f #f))
						  (else
						   (set! rec-flag? #f)
						   (Llambda exp #t '() #f #f #f)))))
			   (if (not (equal? exp '(unspecified)))
				   (remember-exp! exp))
			   (loop (read *pin*)))))))

(define (Load)
   (with-trace 2 'LOAD
   (if (input-port? *pin*)
	   (let loop ((exp (read *pin*)))
		  (if (not (eof-object? exp))
			  (begin
				 (match-case exp
					((import ?module ?file)
					 (remember-module! (symbol->string module) (prefix file)))
					(else #f))
				 (loop (read *pin*))))))))
