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

(module __caml_handle
		(import __caml_constr)
		(extern (include "Clib/caml-bigloo.h")
				(macro get-the-continuation::obj (::obj) "GET_THE_CONTINUATION")
				(macro invoke-continuation::obj  (::obj) "INVOKE_CONTINUATION")
				(export current_handler                  "current_handler")
				(export continuation_value               "continuation_value")
;				(export raise2                           "RAISE___CAML_HANDLE")
				(export caml-raise                       "CAML_RAISE___CAML_HANDLE"))
		(export (staticfail)
				(inline caml-raise value)
				*exception-handlers*
				(inline pop-exception-handler)
				(inline push-exception-handler)
;				(inline raise2 value)
				current_handler
				continuation_value
				(string-of-exception x)
				*try*)) 
 
;*---------------------------------------------------------------------*/
;*    *try*                                                            */
;*---------------------------------------------------------------------*/
(define *try* 0)

;*---------------------------------------------------------------------*/
;*    current_handler                                                  */
;*---------------------------------------------------------------------*/
(define current_handler #f)

;*---------------------------------------------------------------------*/
;*    continuation_value                                               */
;*---------------------------------------------------------------------*/
(define continuation_value #f)

;*---------------------------------------------------------------------*/
;*    staticfail ...                                                   */
;*---------------------------------------------------------------------*/
(define (staticfail)
   (error "staticfail" "Illegal staticfail reached" '()))

;*---------------------------------------------------------------------*/
;*    raise ...                                                        */
;*---------------------------------------------------------------------*/
(define *exception-handlers* 0)

(define-inline (pop-exception-handler)
  (set! *exception-handlers* (-fx *exception-handlers* 1)))

(define-inline (push-exception-handler)
  (set! *exception-handlers* (+fx *exception-handlers* 1)))

(define-inline (caml-raise x)
  (if (=fx *exception-handlers* 0)
	  (error "Fatal error" "uncaught exception." (string-of-exception x))
  (raise x)))

;*---------------------------------------------------------------------*/
;*    string-of-exception ...                                          */
;*---------------------------------------------------------------------*/
(define (string-of-exception x)
  (let ((exn
		 (if (symbol? x)
			 (symbol->string x)
			 (let ((tag (caml-extensible-constr-tag x))
				   (args (take (vector->list x) (-fx (vector-length x) 2))))
			   (apply string-append (symbol->string tag) ": " args)))))
	exn))
