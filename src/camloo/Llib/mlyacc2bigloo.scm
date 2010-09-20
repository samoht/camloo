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

(module mlyacc->bigloo
		(export (mlyacc->bigloo module-name iport oport mliport))
		(main main))

;*---------------------------------------------------------------------*/
;*    mlyacc->bigloo                                                   */
;*---------------------------------------------------------------------*/
(define (mlyacc->bigloo module-name iport oport mliport)
  (read/rp mlyacc iport)
  (let* ((header  (if (symbol? module-name)
					  `(module ,module-name)
					  '()))
		 (prelude (if (null? *prelude*)
					  '()
					  `(define prelude (ml->bigloo ,(apply string-append *prelude*)))))
		 (parser  (if (null? *terminals*)
					  '()
					  `(lalr-grammar
						,*terminals*
						,(map output-rule (reverse *rules*)))))
		 (trailer (if (null? *trailer*)
					  '()
					  `(define trailer (ml->bigloo ,(apply string-append *trailer*)))))
		 (mypp    (lambda (x) (if (not (null? x)) (pp x oport)))))
	(mypp header)
	(mypp prelude)
	(mypp parser)
	(mypp trailer))
  (if (binary-port? mliport)
	  (mlyacc->mli mliport)))

;*---------------------------------------------------------------------*/
;*    main ...                                                         */
;*---------------------------------------------------------------------*/
(define (main args)
   (let* ((args        (parse-args (cdr args)))
		  (src         (car args))
		  (dst         (cadr args))
		  (mli         (caddr args))
		  (iport       #f)
		  (oport       #f)
		  (mliport     #f)
		  (module-name #f))
	 ; open source file / if not set, use stdin
	 (if (string? src)
		 (if (file-exists? src)
			 (set! iport (open-input-file src))
			 (error "mlyacc->bigloo" "Can't find file" src))
		 (set! iport (current-input-port)))
	 ; open destination file / if not set, use stdout
	 (if (string? dst)
		 (begin
		   (set! oport (open-output-file dst))
		   (set! module-name (string->symbol (prefix (basename dst))))
		   (if (not (output-port? oport))
			   (error "mlyacc->bigloo" "Can't open file for output" dst)))
		 (set! oport (current-output-port)))
	 (if (string? mli)
		 (begin
		   (set! mliport (open-output-binary-file mli))
		   (if (not (binary-port? mliport))
			   (error "mlyacc->bigloo" "Can't open file for writing the caml signature" mli))))
	 (unwind-protect (mlyacc->bigloo module-name iport oport mliport)
					 (begin
					   (if (string? src) (close-input-port iport))
					   (if (string? dst) (close-output-port oport))
					   (if (string? mli)
						   (begin
							 (flush-binary-port mliport)
							 (close-binary-port mliport)))))))

;*---------------------------------------------------------------------*/
;*    parse-args! ...                                                  */
;*---------------------------------------------------------------------*/
(define (parse-args args)
  (let ((src #f)
		(dst #f)
		(mli #f))
	(if (null? args)
		(begin
		  (print "No input file has been specified")
		  (exit -1))
		(begin
		  (args-parse args
					  ((("-h" "--help") (help "This help message"))
					   (args-parse-usage #f))
					  (("-o" ?file (help "The output file"))
					   (if (eq? dst #f)
						   (set! dst file)
						   (begin
							 (print "The output file needs to be specified only once")
							 (exit -1))))
					  (("-mli" ?file (help "The created caml signature file"))
					   (if (eq? mli #f)
						   (set! mli file)
						   (begin
							 (print "The caml signature file needs to be specified only once")
							 (exit -1))))
					  (else
					   (if (and (eq? src #f) (string? else))
						   (set! src else)
						   (begin
							 (print "Illegal argument: " else)
							 (exit -1)))))

		  (list src dst mli)))))

;*---------------------------------------------------------------------*/
;# TODO: remove the global variables
;* Global variables
;*---------------------------------------------------------------------*/

(define *prelude* '()) ;ocaml lines of code
(define *trailer* '()) ;ocaml lines of code

(define *terminals* '())

; TODO: how to set a precedence rule for non-terminals ???
(define (add-right! l)
  (let ((ll (filter (lambda (x) (member x *tokens*)) l)))
	(for-each (lambda (x) (putprop! x 'assoc 'right)) ll)
	(if (null? ll)
		'done
		(set! *terminals* (cons `(right: ,@ll) *terminals*)))))

(define (add-left!  l) 
  (let ((ll (filter (lambda (x) (member x *tokens*)) l)))
	(for-each (lambda (x) (putprop! x 'assoc 'left)) ll)
	(if (null? ll)
		'done
		(set! *terminals* (cons `(left: ,@ll) *terminals*)))))

(define (add-nonassoc! l)
  (let ((ll (filter (lambda (x) (member x *tokens*)) l)))
	(for-each (lambda (x) (putprop! x 'assoc 'none)) ll)
	(if (null? ll)
		'done
		(set! *terminals* (cons `(none: ,@ll) *terminals*)))))

; Add all the remaining terminals with the same priority 
(define (add-remaining-terminals)
  (let ((tt (filter
			 (lambda (x)
			   (if (eq? (getprop x 'assoc) #f) #t #f))
			 *tokens*)))
	(for-each (lambda (x) (putprop! x 'assoc 'none)) tt)
	(set! *terminals* (append *terminals* (list (cons none: tt))))))

(define *starts* '())

(define (add-start! s)
  (putprop! s 'start #t)
  (set! *starts* (cons s *starts*)))

(define (add-start-type! s t)
  (if (getprop s 'start)
	  (putprop! s 'type t)))

(define *tokens* '())

(define (add-token! token)
  (set! *tokens* (cons token *tokens*)))

(define (add-token-with-type! token type)
  (add-token! token)
  (putprop! token 'type type))

(define *rules* '())
(define (add-rule! pattern action)
   (set! *rules* (cons `(,pattern ,action) *rules*)))

;*---------------------------------------------------------------------*/
;*    Parser                                                           */
;*---------------------------------------------------------------------*/
(define-macro (my-grammar idents . rules)
  `(regular-grammar 
	((ident     (: (or #\_ alpha) (* (or #\_ alnum))))
	 (space-tab (in #" \t"))
	 (comments  (: "/*" (* (or (out "*") (: "*" (out "/")))) "*/"))
	 ,@idents)
	,@rules))

(define (parse-error char input-port)
  (error/location "mlyacc->bigloo"
				  "Illegal char"
				  char
				  (input-port-name input-port)
				  (input-port-position input-port)))

(define (replace-mlyacc-vars n accu)
  (regular-grammar
   ()
   ((when (=fx n 0) "}") accu)
   ((when (>fx n 0) "}") 
	(read/rp (replace-mlyacc-vars (-fx n 1) (string-append accu "}")) (the-port)))

   ("{" 
	(read/rp (replace-mlyacc-vars (+fx n 1) (string-append accu "{")) (the-port)))

   ((or (out "$") (: "$" (out digit)))
	(read/rp (replace-mlyacc-vars n (string-append accu (the-string)))
			 (the-port)))

   ((: "$" (+ digit))
	(let ((num (the-substring 1 (the-length))))
	  (read/rp (replace-mlyacc-vars n (string-append accu "___" num "___"))
			   (the-port))))

   (else (parse-error (the-failure) input-port))))
			 

(define (idents-of-line-acc acc)
  (my-grammar
   ()
   (space-tab (ignore))
   (comments  (ignore))
   (ident     (read/rp (idents-of-line-acc (cons (string->symbol (the-string)) acc)) (the-port)))
   (else      (unread-char! (the-failure) (the-port))
			  (reverse acc))))

(define (idents-of-line port)
  (read/rp (idents-of-line-acc '()) port))
		
(define declarations
  (my-grammar
   ()
   (blank    (ignore))
   (comments (ignore))

   ;; %token <type_expr> constr ... constr
   ((: "%token <" (* (out ">")) ">")
	(let* ((type  (the-substring 8 -1)))
	  (for-each 
	   (lambda (x) (add-token-with-type! x type)) 
	   (idents-of-line (the-port)))
	  (ignore)))
   
   ;; token
   ((: "%token ")
	(for-each add-token! (idents-of-line (the-port)))
	(ignore))
	
   ;; start
   ((: "%start ")
	(for-each add-start! (idents-of-line (the-port)))
	(ignore))

   ;; type
   ((: "%type <" (* (out ">")) ">")
	(let* ((type  (the-substring 8 -1)))
	  (for-each
	   (lambda (x) (add-start-type! x type))
	   (idents-of-line (the-port)))
	  (ignore)))

   ((: "%right ")
	(add-right! (idents-of-line (the-port)))
	(ignore))

   ((: "%left ")
	(add-left! (idents-of-line (the-port)))
	(ignore))

   ((: "%nonassoc ")
	(add-nonassoc! (idents-of-line (the-port)))
	(ignore))

   ;; %%
   ("%%" 'done)

   ;; else
   (else (parse-error (the-failure) input-port))))

(define eat-space-tab-until-colon
  (my-grammar
   ()
   ((: (* space-tab) ":\n") 'done)))
  
(define right-rule
  (my-grammar
   ()
   (blank    (ignore))
   (comments (ignore))
   ((: "%prec" (* blank) ident) (ignore)) ;TODO: don't know how to handle that 
   ("{" (read/rp (replace-mlyacc-vars 0 "") (the-port)))
   (else (parse-error (the-failure) input-port))))

(define (one-rule port)
  (let* ((left  (idents-of-line port))
		 (right (read/rp right-rule port)))
	(list left right)))

(define (next-rule port)
  (read/rp (my-grammar
			()
			(blank (ignore))
			((: (* space-tab) "|")
			 (cons (one-rule port) (ignore)))
			(";"  '()))
;			(else (unread-char! (the-failure) (the-port))
;				  '()))
		   port))

(define (first-rule port)
  (let* ((hd (one-rule port))
		 (tl (next-rule port))
		 (res (cons hd tl)))
	res))

(define rules
  (my-grammar
   ()
   (blank    (ignore))
   (comments (ignore))
   (ident
	(let ((rule-name (the-string)))
	  (read/rp eat-space-tab-until-colon (the-port))
	  (let ((rule-body (first-rule (the-port))))
		(add-rule! rule-name rule-body)
		(ignore))))
   ("%%"     'done)))

(define (prelude acc)
  (my-grammar
   ()
   ((* (or #\Newline (out "%") (: "%" (out "}"))))
	(read/rp (prelude (cons (the-string) acc)) (the-port)))
   
   ("%}" (reverse acc))))

(define mlyacc
  (my-grammar
   ()
   (comments (ignore))
   (blank    (ignore))
   ("%{"
	(set! *prelude* (read/rp (prelude '()) (the-port)))
	(read/rp declarations (the-port))
	(add-remaining-terminals)
	(read/rp rules (the-port))
	(set! *trailer* (port->string-list (the-port))))
   (else (parse-error (the-failure) input-port))))


;*---------------------------------------------------------------------*/
;*    output-rule ...                                                  */
;*---------------------------------------------------------------------*/
(define (output-rule rule)
  (let ((rule-name  (car rule))
		(rule-body  (cadr rule)))
	`(,(string->symbol rule-name)
	  ,(map (lambda (body) `(,(car body) (ml->bigloo ,(cadr body)))) rule-body))))


;*---------------------------------------------------------------------*/
;*    mli ...                                                          */
;*---------------------------------------------------------------------*/
(define (insert elt l)
  (match-case l
			  (()          '())
			  ((?x)         x)
			  ((?x ?y)      (list x elt y))
			  ((?x ???y) (cons x (cons elt (insert elt y))))))
 

(define (token->string t)
  (let ((token (symbol->string t))
		(type  (getprop t 'type)))
	(if (string? type)
		(string-append token " of " type)
		token)))

(define (start->string s)
  (let ((name (symbol->string s))
		(type (string-append "(lexing__lexbuf -> token) -> lexing__lexbuf -> " (getprop s 'type))))
	(string-append "value " name " : " type ";;")))

(define (mlyacc->mli mliport)
  (let* ((tokens     (map token->string *tokens*))
		 (tokens'    (cons "type token =\n\t" (insert "\n\t| " tokens)))
		 (str-tokens (apply string-append tokens'))
		 (values     (map start->string *starts*))
		 (str-values (apply string-append (insert "\n\n" values)))
		 (my-output  (lambda (x) (output-string mliport x))))
	(my-output str-tokens)
	(my-output ";;\n\n")
	(my-output str-values)))
		