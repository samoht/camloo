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
(module utils
   (include "var.sch")
   (import  init)
   (export  (error a b c)
	    (shape exp)))

;*---------------------------------------------------------------------*/
;*    shape ...                                                        */
;*---------------------------------------------------------------------*/
(define (shape exp)
   (cond
      ((global? exp)
       (symbol-append (global-name exp) '@ (global-module exp)))
      ((local? exp)
       (local-name exp))
      ((not (pair? exp))
       exp)
      ((vector? exp)
       (let* ((len (vector-length exp))
	      (res (make-vector len)))
	  (let loop ((indice 0))
	     (if (=fx indice len)
		 res
		 (begin
		    (vector-set! res
				 indice
				 (shape (vector-ref exp indice)))
		    (loop (+fx indice 1)))))))
      (else
       (let loop ((exp exp))
	  (cond
	     ((null? exp)
	      '())
	     ((not (pair? exp))
	      (shape exp))
	     (else
	      (cons (shape (car exp)) (loop (cdr exp)))))))))
   
;*---------------------------------------------------------------------*/
;*    error ...                                                        */
;*---------------------------------------------------------------------*/
(define (error a b c)
   (close-io!)
   (failure a b c))
