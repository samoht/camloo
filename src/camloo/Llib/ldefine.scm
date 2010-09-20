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
(module Ldefine
		(include "var.sch")
		(import Llambda
				var
				Lconst
				init
				module
				generate
				utils)
		(export (Pset_global exp tl? cp)
				rec-flag?
				(inline? module) 
				(curryfied-lambda exp)
				(curryfied-name global arity)))

;*---------------------------------------------------------------------*/
;*    rec-flag? ...                                                    */
;*---------------------------------------------------------------------*/
(define rec-flag? #f)

;*---------------------------------------------------------------------*/
;*    Pset_global ...                                                  */
;*---------------------------------------------------------------------*/
(define (inline? m)
   (let ((modules-to-inline '("vect" "list" "fvect")))
	  (any? (lambda (x) (string=? x m)) modules-to-inline)))

(define (update-pragma-info! global new-fun)
   (update-current-pragma (list (global-name global)
								(global-arity new-fun)
								(global-name new-fun))))

;; create the global uncurried symbol corresponding to 'global'
(define (update-global tl? global bvalue)
  (with-trace 2 'UPDATE-GLOBAL
  (let ((curry (curryfied-lambda bvalue)))
	(if tl?
		(global-function?-set! global #t)
		(remember-unspecified-var! global))
	(global-arity-set! global (length (cadr curry)))
	(if (>fx (global-arity global) 0)
		(global-args-set! global (list (car (cadr curry)))))
	(trace-item "global=" global " curry=" curry))))


(define (make-new-fun global bvalue)
  (with-trace 2 'MAKE-NEW-FUN
  (let* ((module       (symbol->string (global-module global)))
		 (curry        (curryfied-lambda bvalue))
		 (new-fun-name (curryfied-name global (car curry)))
		 (new-fun      (define-global new-fun-name module)))
	(global-function?-set! new-fun #t)
	(global-arity-set!     new-fun (length (cadr curry)))
	(global-args-set!      new-fun (cadr curry))
	(update-pragma-info!   global new-fun)
	(trace-item "global=" global " new-fun=" new-fun)
	new-fun)))

(define (need-create-new-fun? bvalue)
  (and (pair? bvalue)
	   (eq? (car bvalue) 'lambda)
	   (>fx (car (curryfied-lambda bvalue)) 1)))

(define (Pset_global exp tl? cp)
  (with-trace 2 'PSET_GLOBAL
  (match-case (cdr exp)
    (((Pset_global (qualifiedident ?module ?name)) (?value))
	 (let* (global new-fun bvalue (define-form (if (inline? module) 'define-inline 'define)))
	   (if rec-flag?
		   ;; si on est dans un `letrec' global, il faut definir
		   ;; la fonction avant de parcourir le code de definition.
		   (begin
			 (trace-item "rec-flag")
			 (set! global  (define-global name module))
			 (let ((bvalue0 (Llambda value #f '() #f #t #f)))
			   (update-global tl? global bvalue0)
			   (if (need-create-new-fun? bvalue0)
				   (begin
					 (set! new-fun (make-new-fun global bvalue0))
					 (set! bvalue (Llambda value #f '() #f #t #f)))
				   (set! bvalue bvalue0))))
		   ;; si on est dans un `let' global, il faut *d'abord*
		   ;; parcourir le corps de definition *puis* definir la
		   ;; variable.
		   (begin
			 (set! bvalue (Llambda value #f '() #f #t #f))
			 (set! global (define-global name module))
			 (update-global tl? global bvalue)
			 (if (need-create-new-fun? bvalue)
				 (set! new-fun (make-new-fun global bvalue)))))
	   (if (not tl?)
		   ;; on n'est pas au top-level
		   `(set! ,global ,bvalue)
		   (begin
			 (if (or (not (pair? bvalue))
					 (not (eq? (car bvalue) 'lambda)))
				 ;; arity=0 :
				 `(define ,global ,bvalue)
				 (let ((curry (curryfied-lambda bvalue)))
				   (if (=fx (car curry) 1)
					   ;; arity=1 :
					   (begin
						 (if (and (pair? bvalue) (eq? (car bvalue) 'lambda))
							 `(,define-form (,global ,@(cadr bvalue)) ,(caddr bvalue))
							 `(,define-form ,global ,bvalue)))
					   ;; arity > 1 :
					   (let ((arity     (car curry))
							 (arg-list (cadr curry)))
						 `(begin
							(,define-form (,global ,(car arg-list))
							  ,(let loop ((args (cdr arg-list)))
								 (if (null? args)
									 `(,new-fun ,@arg-list)
									 `(lambda (,(car args))
										,(loop (cdr args))))))
							(,define-form (,new-fun ,@arg-list)
							  ,(caddr curry)))))))))))
	(else
	 (error "camloo" "Illegal `Pset_global' form" exp)))))

;*---------------------------------------------------------------------*/
;*    curryfied-lambda ...                                             */
;*---------------------------------------------------------------------*/
(define (curryfied-lambda value)
   (let loop ((arity 0)
	      (args  '())
	      (value value))
      (match-case value
	 ((lambda (?a) ?body)
	  (loop (+fx arity 1) (cons a args) body))
	 ((begin (lambda (?a) ?body))
	  (loop (+fx arity 1) (cons a args) body))
	 (else
	  (list arity (reverse! args) value)))))

;*---------------------------------------------------------------------*/
;*    curryfied-name ...                                               */
;*---------------------------------------------------------------------*/
(define (curryfied-name global arity)
   (string->symbol (string-append (integer->string arity)
				  "-"
				  (integer->string
				   (get-hash-number (string-upcase
						     (symbol->string
						      (shape global)))))
				  "-"
				  (if (string? (global-name global))
				      (global-name global)
				      (symbol->string (global-name global))))))

