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

(module __caml_bmisc
		(import __caml_handle
				__caml_constr)
		(extern (c-init_camloo!::int ()              "init_camloo")
				(get_next_char::obj (obj)            "get_next_char")
				(parse_engine::obj (obj obj obj obj) "parse_engine")
				(hash_univ_param::obj (obj obj obj)  "hash_univ_param"))
		(export 
		 (init_camloo!)
		 (inline tree_equal s1 s2)))

;*---------------------------------------------------------------------*/
;*    init_camloo! ...                                                 */
;*---------------------------------------------------------------------*/
(define (init_camloo!)
  (if (eq? #t #f)
	  ;; un hack pour etre sur que le module `__error' est initialise
	  (the_failure "init_camloo" "installing" "error-handling")
	  (begin
		(set! current_handler #f)
		(init-static-extensible!))))

;*---------------------------------------------------------------------*/
;*    tree_equal ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (tree_equal s1 s2)
   (equal? s1 s2))
