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

(module __caml_bstring
		(extern (is_printable::bbool (::bchar) "is_printable"))
;				(blit_string::bstring (::obj ::int ::bstring ::int ::int) "blit_string")
;				(fill_string::bstring (::bstring ::int ::int ::bchar) "fill_string")
;				(c-compare_strings::bbool (::bstring ::bstring) "compare_strings"))
		(export (inline string_length::int ::bstring)
				(inline create_string::bstring ::int)
				(inline c-compare_strings::bbool ::bstring ::bstring)
				(inline blit_string::obj ::bstring ::int ::bstring ::int ::int)
				(inline fill_string::obj ::bstring ::int ::int ::bchar)
				(inline compare_strings::bbool ::bstring ::bstring)))


(define-inline (blit_string s x t y z) (blit-string! s x t y z))

(define-inline (fill_string string start len char)
  (let loop ((i 0))
	(if (=fx i len)
		#unspecified
		(begin
		  (string-set-ur! string (+fx i start) char)
		  (loop (+fx i 1))))))

(define-inline (c-compare_strings s t) (string=? s t))

;*---------------------------------------------------------------------*/
;*    string_length ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (string_length s)
   (string-length s))

;*---------------------------------------------------------------------*/
;*    create_string ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (create_string len)
   (make-string len))

;*---------------------------------------------------------------------*/
;*    compare_strings ...                                              */
;*---------------------------------------------------------------------*/
(define-inline (compare_strings s1 s2)
   (c-compare_strings s1 s2))

