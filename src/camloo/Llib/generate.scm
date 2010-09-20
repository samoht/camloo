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
(module generate
		(include "var.sch")
		(library camloo-runtime)
		(import  init
				 utils
				 var
				 module
				 Ldefine)
		(export  (remember-exp!             exp)
				 (get-all-exp)
				 (remember-unspecified-var! var)
				 (generate-module!)))

;*---------------------------------------------------------------------*/
;*    Quelques variables globales                                      */
;*---------------------------------------------------------------------*/
(define *all-exp*             '())
(define *all-unspecified-var* '())

;*---------------------------------------------------------------------*/
;*    remember-unspecified-var! ...                                    */
;*---------------------------------------------------------------------*/
(define (remember-unspecified-var! var)
   (set! *all-unspecified-var* (cons var *all-unspecified-var*)))

;*---------------------------------------------------------------------*/
;*    get-all-exp ...                                                  */
;*---------------------------------------------------------------------*/
(define (get-all-exp)
   *all-exp*)

;*---------------------------------------------------------------------*/
;*    remember-exp! ...                                                */
;*---------------------------------------------------------------------*/
(define (remember-exp! exp)
   (set! *all-exp* (cons exp *all-exp*)))

;*---------------------------------------------------------------------*/
;*    generate-module! ...                                             */
;*---------------------------------------------------------------------*/
(define (generate-module!)
   ;; la declaration de module
   (fprint *pout* ";; Le module ")
   (pp (generate-module-declaration) *pout*)
   (newline *pout*)

   ;; L'initialisation du module
   (fprint *pout* ";; L'initialisation du module")
   (fprint *pout* "(init_camloo!)")
   (newline *pout*)

   ;; les definitions des variables globales rajoutees
   (fprint *pout* ";; Les variables globales ")
   (for-each (lambda (var)
			   (fprint *pout* `(define ,(shape var) (unspecified))))
			 *all-unspecified-var*)
   (newline *pout*)

   ;; Les expressions
   (fprint *pout* ";; Les expressions globales ")
   (for-each (lambda (exp)
			   (pp (shape exp) *pout*) ;pp -> my-write
			   (newline *pout*))
			 (reverse! *all-exp*)))

;*---------------------------------------------------------------------*/
;*    generate-module-declaration ...                                  */
;*---------------------------------------------------------------------*/
(define (generate-module-declaration)
   (define (make-exported-prototypes l)
      (let loop ((l l) (r '()))
		(if (null? l)
			r
			(let ((p (car l)))
			  (cond
			   ((not (global-exported? p)) (loop (cdr l) r))
			   ((not (eq? (global-module p)*basename-symb*)) (loop (cdr l) r))
			   ((not (global-function? p)) (loop (cdr l) (cons (shape p) r)))
			   ((=fx (global-arity p) 0) (loop (cdr l) (cons (shape p) r)))
			   (else
				(loop (cdr l) (cons `(,(shape p)
									  ,@(map shape (global-args p)))
									r))))))))
   (let ((imported
		  (filter-map 
		   (lambda (m) (if (string=? m *basename-str*) #f (string->symbol (module-shape m))))
		   (get-imported-modules)))
		 (exported (make-exported-prototypes (get-all-global)))
		 (afile (filter-map (lambda (x)
							   (match-case x ((?m ?-)
											  (if (eq? m *module-symb*) #f m))))
							*module-alist*)))
	  
	  (if (and *bootstrap* (inline? *basename-str*))
		  (map! (lambda (x) (if (and (list? x) (>fx (length x) 1))
								`(inline ,@x)
								x)) exported))
	  (let ((library-clause (if (not *bootstrap*) '(library camloo-runtime) `(import ,@afile)))
			(include-clause (if (file-exists? *sci-str*) `(include ,*sci-str*) #f))
			(import-clause  (if (and (not *bootstrap*) (>= (length imported) 1))
								`(import ,@imported) #f))
			(export-clause  (if (>= (length exported) 1) `(export ,@exported) #f)))
		 
		 `(module ,*module-symb*
			 ,@(filter (lambda (x) x) 
					   `(,library-clause
						 ,include-clause
						 ,import-clause
						 ,export-clause))))))

;*---------------------------------------------------------------------*/
;*    my-write ...                                                     */
;*---------------------------------------------------------------------*/
(define (my-write obj port)
   (cond
      ((vector? obj)
       (my-write-vector obj port))
      ((pair? obj)
       (my-write-pair obj port))
      ((string? obj)
       (write-char #\# port)
	   (write-char #\" port)
       (display obj port)
	   (write-char #\" port))
	  ((char? obj)
	   (write obj port))
	  ((cnst? obj)
	   (write obj port))
      (else
       (display obj port))))

;*---------------------------------------------------------------------*/
;*    my-write-vector ...                                              */
;*---------------------------------------------------------------------*/
(define (my-write-vector obj port)
   (write-char #\# port)
   (let ((tag (vector-tag obj)))
      (if (>fx tag 0)
	  (begin
	     (if (>=fx tag 100)
		 (display tag port)
		 (begin
		    (display #\0 port)
		    (if (>=fx tag 10)
				(display tag port)
			(begin
			   (display #\0 port)
			   (display tag port))))))))
   (display #\( port)
   (if (=fx 0 (vector-length obj))
       (display #\) port)
       (let ((len (-fx (vector-length obj) 1)))
	  (let loop ((i 0))
	     (if (=fx i len)
		 (begin
		    (my-write (vector-ref obj i) port)
		    (display #\) port))
		 (begin
		    (my-write (vector-ref obj i) port)
		    (display #\space port)
		    (loop (+fx 1 i))))))))
  
;*---------------------------------------------------------------------*/
;*    my-write-pair ...                                                */
;*---------------------------------------------------------------------*/
(define (my-write-pair obj port)
   (display #\( port)
   (let loop ((l obj))
      (cond
	 ((null? (cdr l))
	  (my-write (car l) port)
	  (display #\) port))
	 ((not (pair? (cdr l)))
	  (my-write (car l) port)
	  (display #\space port)
	  (display #\. port)
	  (display #\space port)
	  (my-write (cdr l) port)
	  (display #\) port))
	 (else
	  (my-write (car l) port)
	  (display #\space port)
	  (loop (cdr l))))))
