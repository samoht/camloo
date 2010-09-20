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
(module module
   (include "var.sch")
   (import init
		   var
		   lib_module_list)
   (export (get-imported-modules)
	   (module-shape             module)
	   (remember-module!         module . name)
	   (mark-as-remember-module! module)
	   (update-current-pragma p)
	   (write-current-pragma)
	   (get-arity module fn)))

;*---------------------------------------------------------------------*/
;*    Quelques variables pour se souvenir de tout.                     */
;*---------------------------------------------------------------------*/
(define *modules* '())

;*---------------------------------------------------------------------*/
;*    module-shape ...                                                 */
;*---------------------------------------------------------------------*/
(define (module-shape module)
   (let ((str (if (string? module)
				  module
				  (symbol->string module))))
	  (string-append "__caml_" str)))

;*---------------------------------------------------------------------*/
;*    get-importer-modules ...                                         */
;*---------------------------------------------------------------------*/
(define (get-imported-modules)
   *modules*)

;*---------------------------------------------------------------------*/
;*    remember-module! ...                                             */
;*---------------------------------------------------------------------*/
(define (remember-module! module . mname)
   (with-trace 2 'REMEMBER
   (trace-item "module=" module " mname=" mname)
   (let ((smodule (string->symbol (string-upcase module))))
	  (if (getprop smodule 'remember)
		  'done
		  (begin
			 (putprop! smodule 'remember #t)
			 (if (pair? mname)
				 (putprop! smodule 'filename (car mname))
				 (putprop! smodule 'filename module))
			 (if (not (or
					   (string=? module *basename-str*)
					   (eq? module *basename-symb*)))
				 (update-pragmas smodule))
			 (if (not (member module *lib-module-list*))
				 (set! *modules* (cons module *modules*))))))))

;*---------------------------------------------------------------------*/
;*   mark-as-remember-module! ...                                      */
;*---------------------------------------------------------------------*/
(define (mark-as-remember-module! module)
  (if (string? module)
	  (let ((smodule (string->symbol (string-upcase module))))
		(putprop! smodule 'remember #t))))


(define *pragmas* '((hook 0)))

(define (pp-pragmas)
   (map (lambda (x) (list (car x) (length x))) *pragmas*))

(define (update-pragmas module)
   (with-trace 2 'UPDATE-PRAGMAS
   (trace-item "module=" module " pragmas=" (pp-pragmas))
   (let ((x (assoc module *pragmas*)))
	  (if x
		  (cadr x)
		  (let* ((file     (getprop module 'filename))
				 (filename (string-append file ".pragma")))
			 (if (file-exists? filename)
				 (with-input-from-file filename
					(lambda ()
					   (let ((input (read (current-input-port))))
						  (trace-item "reading " (if input (length input) "0") " entries in " filename)
						  (if input
							  (begin
								 (append! *pragmas* (list (list module input)))
								 (trace-item "pragmas=" (pp-pragmas)))))))
				 (trace-item "cannot find " filename)))))))
   
(define (get-arity module fn)
   (with-trace 2 'GET-ARITY
   (trace-item "module=" module " fn=" fn " type=" (find-runtime-type module))
   (let ((global (get-global fn module))
		 (MODULE (string->symbol (string-upcase module))))
	  (if (string=? module *basename-str*)
		  (let ((arity  (global-arity global)))
			 (trace-item "arity=" arity)
			 arity)
		  (let ((res (let ((elt (assoc MODULE *pragmas*)))
						(trace-item "key=" MODULE " pragmas=" (pp-pragmas) " elt=" (if (list? elt) (car elt) #f))
						(if (pair? elt)
							(let ((fn-pragma (assoc (global-name global) (cadr elt))))
							   (trace-item "key=" (global-name global) " fn-pragma=" fn-pragma)
							   (if (list? fn-pragma)
								   (cadr fn-pragma)
								   #f))
							#f))))
			 (trace-item "m" (global-module global) " fn=" fn " res=" res)
			 res)))))

(define *current-pragma* '((hook 1)))

(define (update-current-pragma p)
   (append! *current-pragma* (list p)))

(define (pragma-file) (string-append (prefix *in*) ".pragma"))

(define (write-current-pragma)
   (let ((output (cdr *current-pragma*)))
	  (if (not (null? output))
		  (with-output-to-file (pragma-file) (lambda () (write output))))))
