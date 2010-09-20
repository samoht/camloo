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

(module hop-names
		(import Llambda)
		(export (hop-of-name::obj ::obj ::obj ::obj)))


; Translation from ML names to HOP names
(define (hop-of-name name cp args)
  (case (string->symbol name)

	((define_service)
	 (let ((service (match-case (car args) ( (Lconst (SCatom ?s)) s ))))
	   (print "service= " service)
	   (print "cadr args= " (cadr args))
	   (let ((args (match-case (cadr args) 
							   ((Lfunction (Lshared ?body -1)) (Llambda body #f cp #f #f #f))
							   (else (Llambda (cadr args) #f cp #f #f #f)))))
		 (print "args= " args)
		 (if (list? args)
			 `(define-service (,(string->symbol service)) (,@args) )
			 `(define-service (,(string->symbol service)) ,args )))))

	((html)
	 (let ((args (Llambda (car args) #f cp #f #f #f)))
	   (print "args= " args)
	   `(apply <HTML> ,args)))

	((body)
	 (let ((args (Llambda (car args) #f cp #f #f #f)))
	   (print "args= " args)
	   `(apply <BODY> ,args)))

	(else
	 (error 'hop-names name "Unknown HOP function"))))

  