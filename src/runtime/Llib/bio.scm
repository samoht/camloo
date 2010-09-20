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

(module __caml_bio
		(extern (open_descriptor::obj (obj)             "open_descriptor")
				(flush::obj           (obj)             "flush")
				(output_char::obj     (obj obj)         "output_char")
				(output_int::obj      (obj obj)         "output_int")
				(seek_out::obj        (obj obj)         "seek_out")
				(pos_out::obj         (obj)             "pos_out")
				(channel_size::obj    (obj)             "channel_size")
				(close_out::obj       (obj)             "close_out")
				(input_char::obj      (obj)             "input_char")
				(input_line::obj      (obj)             "input_line")
				(input_int::obj       (obj)             "input_int")
				(seek_in::obj         (obj obj)         "seek_in")
				(pos_in::obj          (obj)             "pos_in")
				(close_in::obj        (obj)             "close_in")
				(input::obj           (obj obj obj obj) "input")
				(intern-value::obj    (obj obj obj obj) "intern_value")
				(output::obj          (obj obj obj obj) "output")))





