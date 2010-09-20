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
(module Llambda
		(include "trace.sch"
				 "var.sch")
		(import  utils
				 module
				 Lprim
				 Lconst
				 Lswitch
				 var
				 init
				 Ldefine
				 hop-names)
		(export  (Llambda exp tl? cp rw-ref? sg? raise?)
				 (make-local-variable . name)
				 (exit-lexical-block!)
				 (Lstaticfail exp cp)))

;*---------------------------------------------------------------------*/
;*    llambda ...                                                      */
;*    -------------------------------------------------------------    */
;*       - exp est l'expression a compiler                             */
;*       - tl? est un flag indiquant si on se trouve au niveau du      */
;*         top-level                                                   */
;*       - cp est une aliste de description des constructeurs.         */
;*       - rw-ref? est on en train de faire un ref ?                   */
;*       - sg? est-on en train de faire un set-global ?                */
;*       - raise? est-on en train de faire un raise?                   */
;*---------------------------------------------------------------------*/
(define (Llambda exp tl? cp rw-ref? sg? raise?)
   (trace 1 "llambda   : " (shape exp)
	  #\newline
	  "top-level?  : " tl?
	  #\Newline
	  "cp          : " (shape cp)
	  #\Newline
	  "rw-ref?     : " rw-ref?
	  #\Newline
	  "sg?         : " sg?
	  #\Newline
	  "raise?      : " raise?)
   (if (not (pair? exp))
       exp
       (case (car exp)
	  ((import) '(unspecified))
;	   (remember-module! (symbol->string (cadr exp)) (prefix (caddr exp)))
;	   '(unspecified))
	  ((Lvar)
	   (Lvar exp rw-ref? raise?))
	  ((Lconst)
	   (Lconst (cadr exp)))
	  ((Lapply)
	   (Lapply exp cp))
	  ((Lprim)
	   (Lprim exp tl? cp sg? raise?))
	  ((Lcond)
	   (Lcond exp cp))
	  ((Lswitch)
	   (Lswitch exp cp))
	  ((Lshared)
	   (Lshared exp tl? cp))
	  ((Lfunction)
	   (Lfunction exp cp))
	  ((Llet)
	   (Llet exp tl? cp))
	  ((Lletrec)
	   (Lletrec exp tl? cp))
	  ((Lifthenelse)
	   (Lifthenelse exp cp))
	  ((Lsequor)
	   (Lsequor exp cp))
	  ((Lsequand)
	   (Lsequand exp cp))
	  ((Lsequence)
	   (Lsequence exp tl? cp))
	  ((Lwhile exp)
	   (Lwhile exp cp))
	  ((Lfor exp)
	   (Lfor exp tl? cp))
	  ((Lstatichandle)
	   (Lstatichandle exp cp))
	  ((Lstaticfail)
	   (Lstaticfail exp cp))
	  ((Lhandle)
	   (Lhandle exp cp))
	  (else
	   (error "Llambda" "Illegal form" exp)))))

;*---------------------------------------------------------------------*/
;*    Lvar ...                                                         */
;*---------------------------------------------------------------------*/
(define (Lvar exp rw-ref? raise?)
   (trace 11 "Lvar: " exp #\newline
	  *lexical-stack*)
   (define (nth n l)
      (if (=fx n 0)
	  (car l)
	  (nth (-fx n 1) (cdr l))))
   (let ((var (nth (cadr exp) *lexical-stack*)))
      (local-occur-set! var (+fx 1 (local-occur var)))
      (if (and (not rw-ref?) (local? var))
	  (local-value?-set! var #t))
      (if (and (not raise?) (eq? (get-constr-prop var 'exception) 'exception))
		  `(caml-copy-extensible ,var)
		  var)))

;*---------------------------------------------------------------------*/
;*    Lapply ...                                                       */
;*---------------------------------------------------------------------*/
(define (Lapply exp cp)
   (with-trace 2 'LAPPLY
   (letrec ((loop (lambda (args res)
					 (if (null? args)
						 res
						 (loop (cdr args)
							   (list res (Llambda (car args) #f cp #f #f #f)))))))
	  (match-case exp
		 ((Lapply (Lprim (Pget_global (qualifiedident ?module ?name)) ()) ?args)
		  (let ((arity  (get-arity module name))
				(nbargs (length args)))
			 (trace-item "arity=" arity " depth=" nbargs)
			 (if (and (integer? arity) (=fx arity nbargs) (> arity 1))
				 (Lfullapply exp cp)
				 (if (and *hop-mode* (string=? module "hop"))
						(hop-of-name name cp args)
						(loop (caddr exp) (Llambda (cadr exp) #f cp #f #f #f))))))
		 (else (loop (caddr exp) (Llambda (cadr exp) #f cp #f #f #f)))))))

(define (Lfullapply exp cp)
   (with-trace 2 'LFULLAPPLY
   (match-case exp
	  ((Lapply ?fun ?args)
	   (if (=fx (length args) 1)
		   (Lapply exp cp)
		   (let* ((global  (Llambda fun #f cp #f #f #f)) 
				  (bvalues (map (lambda (x) (Llambda x #f cp #f #f #f)) args))
				  (name    (curryfied-name global (length bvalues)))
				  (bmodule (global-module global)))
			  (trace-item "name=" name " bmodule=" bmodule)
			  (remember-module! (symbol->string bmodule))
			  (if (symbol? (global-bname global))
				  (cons (global-bname global) bvalues)
				  (cons (symbol-append name '@ bmodule) bvalues)))))
	  (else (trace-item "Lfullapply(2): " exp)))))
   
;*---------------------------------------------------------------------*/
;*    Lshared ...                                                      */
;*---------------------------------------------------------------------*/
(define (Lshared exp tl? cp)
   (match-case exp
      ((Lshared ?body -1)
       (Llambda body tl? cp #f #f #f))
      (else
       exp)))

;*---------------------------------------------------------------------*/
;*    Lfunction ...                                                    */
;*---------------------------------------------------------------------*/
(define (Lfunction exp cp)
   (let ((var (make-local-variable)))
      (local-value?-set! var #t)
      (let ((res `(lambda (,var)
		     ,(Llambda (cadr exp) #f cp #f #f #f))))
	 (exit-lexical-block!)
	 res)))
  

;*---------------------------------------------------------------------*/
;*    Llet ...                                                         */
;*    -------------------------------------------------------------    */
;*    A cause de la mauvaise compilation du `let .. and ..' je suis    */
;*    oblige de tester en permanance si on n'est pas en train de       */
;*    definir des variables globales                                   */
;*---------------------------------------------------------------------*/
(define (Llet exp tl? cp)
   (match-case exp
      ((?- () ?body)
       (Llambda body tl? cp #f #f #f))
      ((?- ?vals ?body)
       (if (let-and? vals body)
	   (Llet-and-global vals body tl? cp)
;*---------------------------------------------------------------------*/
;*    !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!  */
;*    -------------------------------------------------------------    */
;*    Attention cette fonction ne marche que parce que la fonction     */
;*    `map' est gauche->droite.                                        */
;*---------------------------------------------------------------------*/
	   (let* ((vv  (map (lambda (val)
				(let* ((val (Llambda val #f cp #f #f #f))
				       (new (make-local-variable)))
				   (match-case val
				      ((not (make-cell ?-))
				       (local-value?-set! new #t)))
				   (list new val)))
			     vals))
		  (res `(let ,vv ,(Llambda body #f cp #f #f #f))))
	      (let loop ((i (length vals)))
		 (if (=fx i 0)
		     'done
		     (begin
			(exit-lexical-block!)
			(loop (-fx i 1)))))
	      res)))))
 
;*---------------------------------------------------------------------*/
;*    let-and? ...                                                     */
;*---------------------------------------------------------------------*/
(define (let-and? vals body)
   (match-case body
      ((Lshared ?body -1)
       (let loop ((body body) 
		  (len  (-fx (length vals) 1)))
	  (match-case body
	     (()
	      #f)
	     ((Lprim (Pset_global (qualifiedident ?- ?-)) ((Lvar ?num)))
	      (=fx num len))
	     ((Lsequence ?body1 ?body2)
	      (if (loop body1 len)
		  (loop body2 (-fx len 1))
		  #f))
	     (else
	      #f))))
      (else
       #f)))

;*---------------------------------------------------------------------*/
;*    Llet-and-global ...                                              */
;*---------------------------------------------------------------------*/
(define (Llet-and-global vals _body tl? cp)
   (let loop ((vals     vals)
	      (body     (cadr _body)))
      (if (null? vals)
	  'done
	  (match-case body
	     ((Lsequence ?exp1 (Lsequence . ?-))
	      (set-car! (cdr body) (loop vals exp1))
	      (loop (cdr vals) (caddr body)))
	     ((Lsequence ?exp1 ?exp2)
	      (set-car! (cdr body) (loop vals exp1))
	      (set-car! (cddr body) (loop (cdr vals) exp2)))
	     ((Lprim ?- ?-)
	      (set-car! (cddr body) (list (car vals)))
	      body))))
   (Llambda (cadr _body) tl? cp #f #f #f))

;*---------------------------------------------------------------------*/
;*    dummy-Llambda ...                                                */
;*---------------------------------------------------------------------*/
(define (dummy-Llambda exp dummy-size var-name tl? cp)
   (let ((cexp (Llambda exp tl? cp #f #f #f)))
      (match-case dummy-size
	 ((vector ?int) 
	  `(let ((,var-name (make-vector ,int)))
	      (caml-constr-update! ,var-name ,cexp)
	      ,var-name))
	 (((or tuple record) ?int)
	  `(let ((,var-name (caml-allocate-regular-constr ,int)))
	      (caml-constr-update! ,var-name ,cexp)
	      ,var-name))
	 ((stream)
	  `(let ((,var-name (caml-allocate-regular-constr 2)))
	      (caml-constr-update! ,var-name ,cexp)
	      ,var-name))
	 ((or (function) (parser))
	  cexp)
	 (((?- (?- ?module ?name) . ?-) ?int)
	  (cond
	     ((and (string=? module "builtin")
		   (string=? name "::"))
	      `(let ((,var-name (cons (unspecified) (unspecified))))
		  (caml-constr-update! ,var-name ,cexp)
		  ,var-name))
	     (else
	      `(let ((,var-name (caml-allocate-regular-constr ,int)))
		  (caml-constr-update! ,var-name ,cexp)
		  ,var-name))))
	 (else
	  (error "dummy-Llambda" "Illegal expression" (shape exp))))))
	 
;*---------------------------------------------------------------------*/
;*    Lletrec ...                                                      */
;*    -------------------------------------------------------------    */
;*    pour faire l'optimisation de eta-conversion, il faut:            */
;*      1. compter le nombre de lambda crees.                          */
;*      2. compter le nombre d'arguments passes                        */
;*      3. ajouter des lambda au dessus du tout.                       */
;*      4. ajouter de nouveaux parametres effectifs.                   */
;*---------------------------------------------------------------------*/
(define (Lletrec exp tl? cp)
   (let ((res (Lletrec-unoptimized exp tl? cp)))
      (trace 1 "letrec: " (shape res))
      (match-case res
	 ((letrec ?definitions ?body)
	  (let* ((functions  (map car definitions))
		 (the-lambda (let loop ((body body))
				;; on regarde si body est de la forme:
				;; ((...(the-lambda ?-) ?-) ... ?-)
				;; ou the-lambda est une des fonctions
				;; definies dans le letrec.
				(cond
				   ((not (pair? body))
				    (let ((cell (assq body definitions)))
				       (if (pair? cell)
					   (cadr cell)
					   #f)))
				   (else
				    (loop (car body)))))))
	     (if (not the-lambda)
		 ;; ce n'est pas la fonction `the-lambda' qu'on appelle, on
		 ;; ne fait donc rien
		 res
		 ;; on va peut-etre faire l'optim ...
		 (let* ((formals   (let loop ((res '())
					      (lam  the-lambda))
				      ;; on recupere les parametres formels
				      ;; d'une imbrication de lambda.
				      (match-case lam
					 ((lambda (?arg) . ?body)
					  (loop (cons arg res)
						(car body)))
					 (else
					  (reverse! res)))))
			(n-formals (length formals))
			(n-actuals (let loop ((body body)
					      (res  0))
				      (cond
					 ((not (pair? body))
					  res)
					 (else
					  (loop (car body)
						(+fx res 1)))))))
		    (trace 1 "formals  : " (shape formals))
		    (trace 1 "n-actuals: " (shape n-actuals))
		    (if (<fx n-actuals n-formals)
			;; super, on la fait...
			(let ((new-formals (let loop ((n   (-fx n-formals
								n-actuals))
						      (res '()))
					      (if (=fx n 0)
						  res
						  (loop (-fx n 1)
							(cons (gensym 'a)
							      res))))))
			   (let loop ((new-body    body)
				      (new-formals new-formals))
			      (if (null? new-formals)
				  `(letrec ,definitions ,new-body)
				  `(lambda (,(car new-formals))
				      ,(loop (list new-body (car new-formals))
					     (cdr new-formals))))))
			;; non le code est deja bien ecrit, il n'y a rien
			;; a faire
			res)))))
	 (else
	  res))))

;*---------------------------------------------------------------------*/
;*    Lletrec-unoptimized ...                                          */
;*---------------------------------------------------------------------*/
(define (Lletrec-unoptimized exp tl? cp)
   (match-case exp
      ((?- () ?body)
       (Llambda body tl? cp #f #f #f))
      ((?- ?vals ?body)
       (let* ((vars (map (lambda (val)
			    (make-local-variable))
			 vals))
	      (res `(letrec ,(map (lambda (var val)
				     `(,var ,(dummy-Llambda (car val)
							    (cadr val)
							    var
							    #f
							    cp)))
			       vars vals)
		       ,(Llambda body #f cp #f #f #f))))
	  (let loop ((i (length vals)))
	     (if (=fx i 0)
		 'done
		 (begin
		    (exit-lexical-block!)
		    (loop (-fx i 1)))))
	  res))))

;*---------------------------------------------------------------------*/
;*    Les variables locales                                            */
;*---------------------------------------------------------------------*/
(define *lexical-offset* 0)
(define *lexical-stack*  '())

;*---------------------------------------------------------------------*/
;*    make-local-variable ...                                          */
;*---------------------------------------------------------------------*/
(define (make-local-variable . name)
   (set! *lexical-offset* (+fx 1 *lexical-offset*))
   (let* ((new (string->symbol (string-append (if (null? name)
						  "x"
						  (car name))
					      (integer->string
					       *lexical-offset*))))
		  (local (local new '() #f 0)))
      (trace 11 "make-local-variable: " new #\Newline
	     *lexical-stack*) 
      (set! *lexical-stack* (cons local *lexical-stack*))
      local))

;*---------------------------------------------------------------------*/
;*    exit-lexical-block! ...                                          */
;*---------------------------------------------------------------------*/
(define (exit-lexical-block!)
   (set! *lexical-stack* (cdr *lexical-stack*))
   (set! *lexical-offset* (-fx *lexical-offset* 1)))

;*---------------------------------------------------------------------*/
;*    Lifthenelse ...                                                  */
;*---------------------------------------------------------------------*/
(define (Lifthenelse exp cp)
   (let* ((si (Llambda (cadr exp) #f cp #f #f #f))
	  (alors (Llambda (caddr exp) #f cp #f #f #f))
	  (sinon (Llambda (cadddr exp) #f cp #f #f #f)))
      `(if ,si ,alors ,sinon)))

;*---------------------------------------------------------------------*/
;*    Lsequor ...                                                      */
;*---------------------------------------------------------------------*/
(define (Lsequor exp cp)
   (let* ((exp1 (Llambda (cadr exp) #f cp #f #f #f))
	  (exp2 (Llambda (caddr exp) #f cp #f #f #f)))
      `(or ,exp1 ,exp2)))

;*---------------------------------------------------------------------*/
;*    Lsequand ...                                                     */
;*---------------------------------------------------------------------*/
(define (Lsequand exp cp)
   (let* ((exp1 (Llambda (cadr exp) #f cp #f #f #f))
	  (exp2 (Llambda (caddr exp) #f cp #f #f #f)))
      `(and ,exp1 ,exp2)))

;*---------------------------------------------------------------------*/
;*    Lsequence ...                                                    */
;*---------------------------------------------------------------------*/
(define (Lsequence exp tl? cp)
   ;; si on est au top-level, on commence par traite le cas
   ;; possible de redefinition de fonction global.
   (if tl?
       (overwrite-global-definition! exp))
   (let* ((exp1 (Llambda (cadr exp) tl? cp #f #f #f))
	  (exp2 (Llambda (caddr exp) tl? cp #f #f #f)))
      `(begin ,exp1 ,exp2)))

;*---------------------------------------------------------------------*/
;*    Lwhile ...                                                       */
;*---------------------------------------------------------------------*/
(define (Lwhile exp cp)
   (let* ((loop (gensym))
	  (test (Llambda (cadr exp) #f cp #f #f #f))
	  (body (Llambda (caddr exp) #f cp #f #f #f)))
      `(let ,loop ()
	  (if ,test
	      (begin
		 ,body
		 (,loop))
	      '()))))

;*---------------------------------------------------------------------*/
;*    Lfor ...                                                         */
;*    -------------------------------------------------------------    */
;*    On fait un peu un hack pour bien compiler les `for'. On marque   */
;*    la variable qu'on est en train d'introduire avec la propriete    */
;*    `for-indice', dans la compilation des accesseurs et des setters, */
;*    on utilisera cette marque.                                       */
;*---------------------------------------------------------------------*/
(define (Lfor exp tl? cp)
   (match-case exp
      ((?- ?init ?stop ?way ?body)
       (let* ((test      (if way '<=fx '>=fx))
	      (incr      (if way '+fx '-fx))
	      (new-cp    (unspecified))
	      (indice    (let ((indice (make-local-variable "i")))
			    (set! new-cp (set-constr-prop! indice 'for-indice))
			    indice))
	      (for       (gensym 'for))
	      (stop-v    (gensym 'stop))
	      (user-body (let* ((dummy1 (make-local-variable))
				(body   (Llambda body #f (append new-cp cp)
						 #f #f #f)))
			    (exit-lexical-block!)
			    body)))
	  (unset-constr-prop! indice 'for-indice)
	  (exit-lexical-block!)
	  `(let ((,stop-v ,(begin (make-local-variable)
				  (let ((res (Llambda stop #f cp #f #f #f)))
				     (exit-lexical-block!)
				     res))))
	      (let ,for ((,indice ,(Llambda init #f cp #f #f #f)))
		   (if (,test ,indice ,stop-v)
		       (begin
			  ,user-body
			  (,for (,incr ,indice 1)))
		       (unspecified))))))
      (else
       (error "camloo" "Illegal `Lfor' form" exp))))

;*---------------------------------------------------------------------*/
;*    *static-fail* ...                                                */
;*---------------------------------------------------------------------*/
(define *static-fail* '())

;*---------------------------------------------------------------------*/
;*    Lstaticfail ...                                                  */
;*---------------------------------------------------------------------*/
(define (Lstaticfail exp cp)
   (if (null? *static-fail*)
       '(staticfail)
       (list (car *static-fail*))))


(define (Lstatichandle exp cp)
   (match-case exp
      ((?- ?body (Lstaticfail))
       (Llambda body #f cp #f #f #f))
      ((?- (Llet ((Lhandle . ?-)) . ?-) ?rest)
       ;; le cas qui tue des streams...vraiment
       (let ((fail  (gensym 'staticfail))
             (exit  (gensym 'staticexit))
             (fbody (begin (make-local-variable)
                           (let ((res (Llambda rest #f cp #f #f #f)))
                              (exit-lexical-block!)
                              `(begin
                                  ,res)))))
          (set! *static-fail* (cons fail *static-fail*))
          (let* ((res `(bind-exit (,exit)
                          (labels ((,fail ()
                                          (,exit ,fbody)))
                             ,(Llambda (cadr exp) #f cp #f #f #f)))))
             (set! *static-fail* (cdr *static-fail*))
             res)))
      (else
       (let ((fail  (gensym 'staticfail))
             (fbody (Llambda (caddr exp) #f cp #f #f #f)))
          (set! *static-fail* (cons fail *static-fail*))
          (let* ((res `(labels ((,fail () ,fbody))
                          ,(Llambda (cadr exp) #f cp #f #f #f))))
             (set! *static-fail* (cdr *static-fail*))
             res)))))

; create a new lexical scope to handle the argument of raise
(define (Lhandle exp cp)
   (match-case exp
      ((Lhandle ?body ?catch)
       (let* ((lbody       (Llambda body  #f cp #f #f #f))
              (handler-var (make-local-variable))
              (lcatch.old      `(begin
                                   (pop-exception-handler)
                                   ,(Llambda catch #f cp #f #f #f)))
              (lcatch      (Llambda catch #f cp #f #f #f)))
          (exit-lexical-block!)
          `(with-handler
              (lambda (,handler-var)
                 ,lcatch)
              (unwind-protect
                 (begin
                    (push-exception-handler)
                    ,lbody)
                 (pop-exception-handler)))))
      (else
       (error "Llambda" "Illegal Lhandle form" exp))))