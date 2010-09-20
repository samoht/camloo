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
(module Lswitch
		(library camloo-runtime)
		(include "trace.sch")
		(import utils
				module
				Lprim
				Lconst
				Llambda)
		(export (Lcond   exp cp)
				(Lswitch exp cp)))

;*---------------------------------------------------------------------*/
;*    Lcond ...                                                        */
;*    -------------------------------------------------------------    */
;*    On memorise tous les body dans les `Lcond' pour faire du         */
;*    partage quand deux body sont equal?                              */
;*---------------------------------------------------------------------*/
(define (Lcond exp cp)
   (if (Lcond-is-case? exp)
       (Lcond/case exp cp)
       (Lcond/cond exp cp)))

;*---------------------------------------------------------------------*/
;*    Lcond-is-case? ...                                               */
;*---------------------------------------------------------------------*/
(define (Lcond-is-case? exp)
   (let loop ((clauses (caddr exp))
	      (num     0))
      (if (null? clauses)
	  (>fx num 3)
	  (let ((test-for (car (car clauses))))
	     (if (or (char? test-for) (integer? test-for))
		 (loop (cdr clauses)
		       (+fx num 1))
		 #f)))))
      
;*---------------------------------------------------------------------*/
;*    Lcond/cond ...                                                   */
;*---------------------------------------------------------------------*/
(define (Lcond/cond exp cp)
   (define (test-for-eq value)
      (cond
	 ((char? value)
	  'char=?)
	 ((integer? value)
	  '=fx)
	 ((string? value)
	  'string=?)
	 (else
	  'equal?)))
   (let ((aux (gensym)))
      `(let ((,aux ,(Llambda (cadr exp) #f cp #f #f #f)))
	  (cond
	     ,@(let loop ((clauses (caddr exp))
			  (memo '())
			  (res  '()))
		  (if (null? clauses)
		      (reverse! (cons `(else ,(Lstaticfail 'dummy cp)) res))
		      (let* ((c    (car clauses))
			     (cnst (let ((cnst (car c)))
				      (if (string? cnst)
					  (string-for-read cnst)
					  cnst)))
			     (body (cadr c))
			     (cell (assoc body memo)))
			 (if cell
			     (let* ((values (cdr cell))
				    (old    (cons (car values) (cdr values)))
				    (test   `(,(test-for-eq cnst) ,aux ,cnst)))
				(set-car! values 'or)
				(set-cdr! values (cons test (cons old '())))
				(loop (cdr clauses)
				      memo
				      res))
			     (let ((test `(,(test-for-eq cnst) ,aux ,cnst)))
				(loop (cdr clauses)
				      (cons (cons body test)
					    memo)
				      (cons `(,test
					      ,(Llambda body #f cp #f #f #f))
					    res)))))))))))

;*---------------------------------------------------------------------*/
;*    Lcond/case ...                                                   */
;*---------------------------------------------------------------------*/
(define (Lcond/case exp cp)
   `(case ,(Llambda (cadr exp) #f cp #f #f #f)
       ,@(let loop ((clauses (caddr exp))
		    (memo '())
		    (res  '()))
	    (if (null? clauses)
		(reverse! (cons `(else ,(Lstaticfail 'dummy cp)) res))
		(let* ((c    (car clauses))
		       (cnst (car c))
		       (body (cadr c))
		       (cell (assoc body memo)))
		   (if cell
		       (let ((values (cdr cell)))
			  (set-cdr! values (cons (car values) (cdr values)))
			  (set-car! values cnst)
			  (loop (cdr clauses)
				memo
				res))
		       (let ((new-values (list cnst)))
			  (loop (cdr clauses)
				(cons (cons body new-values)
				      memo)
				(cons `(,new-values
					,(Llambda body #f cp #f #f #f))
				      res)))))))))

;*---------------------------------------------------------------------*/
;*    Lswitch ...                                                      */
;*    -------------------------------------------------------------    */
;*    On memorise tous les body dans les `Lswitch' pour faire du       */
;*    partage quand deux body sont equal?                              */
;*    -------------------------------------------------------------    */
;*    Le principe de la compilation du `Lswitch' est de regrouper      */
;*    ensemble tous les constructeurs constants, de generer un         */
;*    `cond' pour eux puis sur les constructeurs alloues, de faire     */
;*    un `case'.                                                       */
;*---------------------------------------------------------------------*/
(define (Lswitch exp cp)
   (match-case exp
      ((?- ?- ?obj ())
       (error "Lswith" "Illegal form" exp))
      ((?- ?number ?obj ?clauses)
       (let* ((Class      (Lswitch-class clauses))
	      (bobj       (Llambda obj #f cp #f #f #t)))
	  ;; la compilation de bobj doit se faire dans un
	  ;; contexte ou raise? est vrai
	  ;; (car on fait un caml-extensible-constr-tag juste derriere
	  (case Class
	     ((extensible)
	      (Lswitch-variable 'caml-extensible-constr-tag
				bobj
				number
				clauses
				cp))
	     ((regular)
	      (Lswitch-mixte bobj number clauses cp))
	     ((ref)
	      (Lswitch-ref bobj number clauses cp))
	     (else
	      (Lswitch-cons bobj number clauses cp)))))))

;*---------------------------------------------------------------------*/
;*    Lswitch-class...                                                 */
;*    -------------------------------------------------------------    */
;*    On examine les clauses du `Lswitch' pour voir si on filtre       */
;*       1. un constructeur `extensible'                               */
;*       2. un constructeur `::'                                       */
;*       3. un constructeur `regular'                                  */
;*---------------------------------------------------------------------*/
(define (Lswitch-class clauses)
   (let loop ((clauses clauses))
      (if (null? clauses)
	  'regular
	  (match-case (car (car clauses))
	     ((ConstrConstant (qualifiedident ?module ?name) ?- ?-)
	      (if (and (string=? module "builtin")
		       (string=? name "[]"))
		  '::
		  (loop (cdr clauses))))
	     ((ConstrRegular (qualifiedident ?module ?name) ?- ?-)
	      (cond
		 ((and (string=? module "builtin")
		       (string=? name "::"))
		  '::)
		 ((and (string=? module "ref")
		       (string=? name "ref"))
		  'ref)
		 (else
		  'regular)))
	     ((ConstrExtensible . ?-)
	      'extensible)
	     (else
	      (loop (cdr clauses)))))))

;*---------------------------------------------------------------------*/
;*    Lswitch-variable ...                                             */
;*---------------------------------------------------------------------*/
(define (Lswitch-variable get-tag-of bobj number clauses cp)
   (cond
      ((null? clauses)
       (if (=fx number 0)
	   #f
	   (Lstaticfail 'dummy cp)))
      ((and (null? (cdr clauses))
	    (=fx number 1))
       (Llambda (cadr (car clauses)) #f cp #f #f #f))
      (else
       `(case ,(if (>fx number (length clauses))
		   `(if (caml-constant-constr? ,bobj)
			-1
			(,get-tag-of ,bobj))
		   `(,get-tag-of ,bobj))
		  ,@(let loop ((clauses clauses)
					   (num     number)
					   (memo    '())
					   (res     '()))
			  (cond
			   ((null? clauses)
				(reverse! (cons `(else ,(Lstaticfail 'dummy cp))
								res)))
			   ((=fx num 1)
				(reverse! (cons `(else
								  ,(Llambda
									(cadr (car clauses)) #f cp #f #f #f))
								res)))
			   (else
				(let* ((c    (car clauses))
					   (cnst (constr-tag-value (car c)))
					   (body (cadr c))
					   (cell (assoc body memo)))
				  (if cell
					  (let ((values (cdr cell)))
						(set-cdr! values
								  (cons (car values)
										(cdr values)))
						(set-car! values cnst)
						(loop (cdr clauses)
							  (-fx num 1)
							  memo
							  res))
					  (let ((new-values (list cnst)))
						(loop (cdr clauses)
							  (-fx num 1)
							  (cons (cons body new-values)
									memo)
							  (cons `(,new-values
									  ,(Llambda body #f cp #f #f #f))
									res))))))))))))
		   
 
;*---------------------------------------------------------------------*/
;*    Lswitch-mixte ...                                                */
;*---------------------------------------------------------------------*/
(define (Lswitch-mixte bobj number clauses cp)
   ;; on commence par isoler toutes les clauses qui consernent
   ;; des constructeurs constants 
   (let ((constant '())
	 (regular  '())) 
      (for-each (lambda (c)
		   (case (car (car c))
		      ((ConstrExtensible)
		       (error "Lswitch" "Illegal switch" clauses))
		      ((ConstrRegular)
		       (set! regular (cons c regular)))
		      (else
		       (set! constant (cons c constant)))))
		clauses)
      (cond
	 ((null? constant)
	  (Lswitch-variable 'caml-regular-constr-tag
			    bobj
			    number
			    clauses
			    cp))
	 ((null? clauses)
	  (if (=fx number 0)
	      #f
	      (Lstaticfail 'dummy cp)))
	 ((and (null? (cdr clauses))
	       (=fx number 1))
	  (Llambda (cadr (car clauses)) #f cp #f #f #f))
	 (else
	  (let ((aux (gensym)))
	     `(let ((,aux ,bobj))
		 (cond
		    ,@(let loop ((clauses (reverse! constant))
				 (number  number)
				 (res     '()))
			 (if (null? clauses)
			     (reverse! (cons `(else
					       ,(Lswitch-variable
						 'caml-regular-constr-tag
						 aux
						 number
						 (reverse! regular)
						 cp))
					     res))
			     (let* ((c    (car clauses))
				    (tag  (car c))
				    (body (cadr c)))
				(loop (cdr clauses)
				      (-fx number 1)
				      (cons
				       `((eq? ,aux ,(constr-tag-value-as-cnst tag #f))
					 ,(Llambda body #f cp #f #f #f))
				       res))))))))))))

;*---------------------------------------------------------------------*/
;*    Lswitch-cons ...                                                 */
;*    -------------------------------------------------------------    */
;*    La particuliere compilation des filtrages concernant les `cons'  */
;*---------------------------------------------------------------------*/
(define (Lswitch-cons bobj number clauses cp)
   (let* ((cp++           (append (set-constr-prop! bobj '::) cp))
	  (default-clause (Llambda '(Lstaticfail 'dummy cp) #f cp #f #f #f))
	  (null-clause    default-clause)
	  (pair-clause    default-clause))
      (for-each (lambda (c)
		   (match-case (car c)
		      ((ConstrConstant . ?-)
		       (set! null-clause (Llambda (cadr c) #f cp++ #f #f #f)))
		      ((ConstrRegular . ?-)
		       (set! pair-clause (Llambda (cadr c) #f cp++ #f #f #f)))
		      (else
		       (error "Lswitch-::" "internal error" (shape clauses)))))
		clauses)
      (let ((res `(if (null? ,bobj)
		      ,null-clause
		      ,pair-clause)))
	 (unset-constr-prop! bobj '::)
	 res)))
   
;*---------------------------------------------------------------------*/
;*    Lswitch-ref ...                                                  */
;*    -------------------------------------------------------------    */
;*    La particuliere compilation du filtrage concernant les `ref'     */
;*---------------------------------------------------------------------*/
(define (Lswitch-ref bobj number clauses cp)
   (let* ((cp++ (append (set-constr-prop! bobj 'ref) cp))
	  (res  (Llambda (cadr (car clauses)) #f cp++ #f #f #f)))
      (unset-constr-prop! bobj 'ref)
      res))


			     
		 
       

       

