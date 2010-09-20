COMMON = 	lexuniv.mli lexuniv.ml syntaxe.mli syntaxe.ml                 \
			interp.mli valeur.mli valeur.ml  envir.mli interp.ml envir.ml \
			typage.mli typage.ml
IPASCAL =	$(COMMON) ipascal.ml
CPASCAL =	$(COMMON) compil.mli compil.ml cpascal.ml

all: ipascal cpascal

ipascal: $(IPASCAL)
	$(MAKE) FILES="$(IPASCAL)" TARGET=ipascal build

cpascal: $(CPASCAL)
	$(MAKE) FILES="$(CPASCAL)" TARGET=cpascal build

clean: ipascal.clean cpascal.clean
	$(RM) -f *.zi *.zix *.o *.c *.scm *.sci *~ *.lam

include ../../Makefile.camloo

