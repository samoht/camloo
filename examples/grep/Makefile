FILES 	= expr.mli expr.ml auto.mli auto.ml ensent.mli ensent.ml determ.mli determ.ml grep.ml
TARGET 	= grep

.PHONY:all
all: build

clean: grep.clean
	$(RM) *.zi *.zix *.o *~ *.scm *.sci *.c *.zo *.lam *.pragma

include ../../Makefile.camloo
