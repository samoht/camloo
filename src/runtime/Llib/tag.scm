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

(module __caml_tag
		(import __caml_constr)
		(extern (include "Clib/fail.h")
				(include "Clib/caml-bigloo.h")
				(include "Clib/value-bigloo.h")
				(macro OUT_OF_MEMORY_EXN::int     "OUT_OF_MEMORY_EXN")
				(macro SYS_ERROR_EXN::int         "SYS_ERROR_EXN")
				(macro FAILURE_EXN::int           "FAILURE_EXN")
				(macro INVALID_EXN::int           "INVALID_EXN")
				(macro END_OF_FILE_EXN::int       "END_OF_FILE_EXN")
				(macro ZERO_DIVIDE_EXN::int       "ZERO_DIVIDE_EXN")
				(macro BREAK_EXN::int             "BREAK_EXN")
				(macro NOT_FOUND_EXN::int         "NOT_FOUND_EXN")
				(macro UNIX_ERROR_EXN::int        "UNIX_ERROR_EXN")
				(macro GRAPHIC_FAILURE_EXN::int   "GRAPHIC_FAILURE_EXN")
				(macro PARSE_FAILURE_EXN::int     "PARSE_FAILURE_EXN")
				(macro Num_tags::bint             "Num_tags")
				(macro No_scan_tag::bint          "No_scan_tag")
				(macro Scan_tag::bint             "Scan_tag")
				(macro Closure_tag::bint          "Closure_tag")
				(macro String_tag::bint           "String_tag")
				(macro Double_tag::bint           "Double_tag")
				(macro obj_is_block::bool ::obj   "Is_block"))
		(export (double-tag)
				(string-tag)
				(tag-of value)))

(define (double-tag) Double_tag)
(define (string-tag) String_tag)
;*---------------------------------------------------------------------*/
;*    tag-of ...                                                       */
;*---------------------------------------------------------------------*/
(define (tag-of value)
  (cond ((caml-extensible-constr? value)
		 (case (caml-extensible-constr-tag value)
		   ((Out_of_memory_1@exc)
			OUT_OF_MEMORY_EXN)
		   ((Invalid_argument_2@exc)
			INVALID_EXN)
		   ((Failure_3@exc)
			FAILURE_EXN)
		   ((Not_found_4@exc)
			NOT_FOUND_EXN)
		   ((Sys_error_1@sys)
			SYS_ERROR_EXN)
		   ((Break_2@sys)
			BREAK_EXN)
		   ((End_of_file_1@io)
			END_OF_FILE_EXN)
		   ((Division_by_zero_1@int)
			ZERO_DIVIDE_EXN)
		   ((Parse_failure_1@stream)
			PARSE_FAILURE_EXN)
		   ((Parse_error_2@stream)
			PARSE_FAILURE_EXN)
		   (else
			-1)))
		((fixnum? value)
		 Num_tags)
		((cnst? value)
		 (cnst->integer value))
		((string? value)
		 String_tag)
		((char? value)
		 Num_tags)
		((flonum? value)
		 Double_tag)
		((procedure? value)
		 Closure_tag)
		(else
		 Scan_tag)))

	    
