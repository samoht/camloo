DEFAULT_LIB_DIR = $(shell bigloo -q -eval "(begin (print *default-lib-dir*) (exit 0))")

include $(DEFAULT_LIB_DIR)/Makefile.config
include $(DEFAULT_LIB_DIR)/Makefile.misc

MAKEFILE_CAMLOO = ../../Makefile.camloo 
CAMLOO_LIBDIR	= $(LIBDIR)/camloo

#*---------------------------------------------------------------------*/
#*    Compilers, Tools and Destinations                                */
#*---------------------------------------------------------------------*/
# the library name
API             = camloo
EXEC            = camloo
# Directories
MY_LIB          = ../../lib
BOOTLIBDIR      = $(MY_LIB)
BIN             = ../../bin
BIGLOO_SRC_DIR  = Llib
BIGLOO_BSRC_DIR = Llib.bootstrap
CAML_SRC_DIR    = Mlib
MISC_SRC_DIR    = Misc
RUNTIME_SRC_DIR = ../runtime
C_SRC_DIR       =  $(RUNTIME_SRC_DIR)/Clib
# The Bigloo compiler
BIGLOO          = $(BGLBUILDBIGLOO)
AFILE           = $(BGLBUILDBINDIR)/$(AFILE_EXE)
JFILE           = $(BGLBUILDBINDIR)/$(JFILE_EXE)
DEPEND          = $(BGLBUILDBINDIR)/$(BDEPEND_EXE)
BTAGS           = $(BGLBUILDBINDIR)/$(BTAGS_EXE)
# Bigloo compilation options
BAPIFLAGS       = $(BFLAGS) -I $(BIGLOO_SRC_DIR) -I $(BOOTLIBDIR) -lib-dir $(BOOTLIBDIR) \
                  -srfi $(API) -rm -unsafe -safee #-g3 -cg
CAPIFLAGS       = -I $(DEFAULT_LIB_DIR)
LDEXTRA         = -L$(DEFAULT_LIB_DIR)
CEFLAGS         = -I $(DEFAULT_LIB_DIR)
# Flags to build a heap
BHEAPFLAGS      = -unsafe -q -mkaddheap -mkaddlib -L $(LIBDIR) -I $(BIGLOO_SRC_DIR) \
                  -heap-library $(API) -srfi $(API)

#*---------------------------------------------------------------------*/
#*    Scheme extended objects                                          */
#*---------------------------------------------------------------------*/
_CAMLOO_OBJECTS = \
	hop-names init utils llambda generate module \
	lprim var lconst lswitch ldefine liblist ref \
	pmakeblock camloo

_CAMLC_OBJECTS = \
	config misc const prim globals instruct lambda   \
	location syntax errors modules builtins types    \
	pr_type ty_error typing ty_decl pr_decl ty_intf  \
	tr_env  match trstream front back opcodes        \
	prim_opc buffcode labels reloc emitcode emit_phr \
	primdecl lexer par_aux parser compiler lam dump  \
	version main

CAMLC_SRC 		= \
	config.mli config.ml location.mli misc.ml const.ml     \
	prim.ml globals.ml instruct.ml lambda.ml location.ml   \
	syntax.ml errors.ml modules.ml pr_type.mli             \
	builtins.ml types.ml pr_type.ml ty_error.ml typing.ml  \
	ty_decl.ml pr_decl.ml ty_intf.ml tr_env.ml match.ml    \
	trstream.ml front.ml back.ml opcodes.ml prim_opc.ml    \
	buffcode.ml labels.ml reloc.ml emitcode.ml emit_phr.ml \
	primdecl.ml parser.mli lexer.mli lexer.ml par_aux.ml   \
	parser.ml compiler.ml lam.ml dump.ml version.ml main.ml

_ZI_RUNTIME 	= int exc fstring fchar ref string char bool eq list \
				  fvect vect sys filename float pair random baltree  \
				  map stack set sort queue obj io arg stream obj     \
				  printf printexc hashtbl lexing genlex parsing      \
				  iparsing hop

_OBJECTS		= $(_CAMLOO_OBJECTS) $(_CAMLC_OBJECTS)
OBJECTS			= $(_OBJECTS:%=objs/%.o)

EOBJECTS		= objs/make_lib.o

ZI_OBJECTS  	= $(_ZI_RUNTIME:%=$(MY_LIB)/%.zi)

REBUILD_TARGET 	= $(patsubst %.mli, $(CAML_SRC_DIR)/%.zi, \
				  $(patsubst %.ml,  $(CAML_SRC_DIR)/%.scm, $(CAMLC_SRC)))

_BGL_SOURCES	= $(_CAMLOO_OBJECTS:%=$(BIGLOO_SRC_DIR)/%.scm) \
				  $(_CAMLC_OBJECTS:%=$(BIGLOO_BSRC_DIR)/%.scm)

#*---------------------------------------------------------------------*/
#*    all                                                              */
#*---------------------------------------------------------------------*/
.PHONY: all bootstrap zi exec c

all:
	mkdir -p $(BOOTBINDIR) && \
	$(MAKE) c exec zi

zi: $(ZI_OBJECTS)

exec: $(_BGL_SOURCES) $(EXEC)

bootstrap:
	if [ -e $(BIGLOO_BSRC_DIR) ]; then \
		$(MAKE) && \
		if [ -e $(BIN)/$(EXEC).ok ]; then \
			rm -rf $(BIN)/$(EXEC).ok; \
		fi && \
		if [ -e $(BIGLOO_BSRC_DIR).ok ]; then \
			rm -rf $(BIGLOO_BSRC_DIR).ok; \
		fi && \
		cp $(BIN)/$(EXEC) $(BIN)/$(EXEC).ok && \
		cp -r $(BIGLOO_BSRC_DIR) $(BIGLOO_BSRC_DIR).ok; \
	fi && \
	$(RM) -f $(MY_LIB)/*.zi && \
	(	$(MAKE) zi && \
		$(RM) -f $(CAML_SRC_DIR)/*.scm && \
		$(RM) -f $(CAML_SRC_DIR)/*.sci && \
		$(RM) -f $(CAML_SRC_DIR)/*.lam && \
		$(RM) -f $(CAML_SRC_DIR)/*.zi && \
		$(MAKE) -f $(MAKEFILE_CAMLOO) $(REBUILD_TARGET) \
			STDLIB=$(MY_LIB) ML_FLAGS="-include Mlib" \
			AFILE="afile-bootstrap" && \
		mkdir -p $(BIGLOO_BSRC_DIR) && \
		mv $(CAML_SRC_DIR)/*.scm $(BIGLOO_BSRC_DIR) && \
		$(MAKE) exec && \
		$(RM) -f $(MY_LIB)/*.zi && \
		$(MAKE) zi ) \
	|| ($(MAKE) bootstrap-recover && exit)

bootstrap-recover:
	if [ -e $(BIGLOO_BSRC_DIR).ok ]; then \
		rm -rf $(BIGLOO_BSRC_DIR) && \
		cp -rf $(BIGLOO_BSRC_DIR).ok $(BIGLOO_BSRC_DIR); \
	fi && \
	if [ -e $(BIN)/$(EXEC).ok ]; then \
		rm -f $(BIN)/$(EXEC) && \
		cp -f $(BIN)/$(EXEC).ok $(BIN)/$(EXEC); \
	fi

c:
	for file in $(_CAMLC_OBJECTS); do \
		if [ -e $(BIGLOO_BSRC_DIR)/$$file.sci ]; then \
			ln -f -s ../$(BIGLOO_SRC_DIR)/$$file.sci $(BIGLOO_SRC_DIR); \
		fi; \
		ln -f -s ../$(BIGLOO_BSRC_DIR)/$$file.scm $(BIGLOO_SRC_DIR); \
	done && \
	mkdir -p objs && \
	$(MAKE) heap-c

$(MISC_SRC_DIR)/$(API).init: $(MISC_SRC_DIR)/$(API).init.in
	cp $^ $@
#	@ echo "*** ERROR: $@ is out of date (older than $?)"
#	@ echo "You need to re-configure \"(cd ..; ./configure --bootconfig)\""
#	@ exit 1

#*---------------------------------------------------------------------*/
#*  install                                                            */
#*---------------------------------------------------------------------*/
.PHONY: install uninstall

CP = cp # --force --backup
MODFILE = -xw+r

install: # api-install-init
	mkdir -p $(CAMLOO_LIBDIR)
	$(CP) $(BIN)/camloo $(BINDIR)/camloo && \
	chmod $(BMASK) $(BINDIR)/camloo && \
	$(CP) $(MY_LIB)/*.zi $(CAMLOO_LIBDIR)/ && \
	chmod $(MODFILE) $(CAMLOO_LIBDIR)/*.zi # && $(MAKE) api-install-c

uninstall: # api-uninstall-init api-uninstall-c
	$(RM) -rf $(CAMLOO_LIBDIR)/
	$(RM) -f  $(BINDIR)/camloo

#*---------------------------------------------------------------------*/
#*    clean                                                            */
#*---------------------------------------------------------------------*/
bootstrap-clean: clean
	$(RM) -f $(CAML_SRC_DIR)/*.zi
	$(RM) -f $(CAML_SRC_DIR)/*.lam
	$(RM) -f $(CAML_SRC_DIR)/*.pragma
	$(RM) -f $(CAML_SRC_DIR)/*.scm
	$(RM) -f $(CAML_SRC_DIR)/*.sci
	$(RM) -rf $(BIGLOO_BSRC_DIR).ok/

clean: # api-clean
	for file in $(_CAMLC_OBJECTS); do \
		$(RM) -f  $(BIGLOO_SRC_DIR)/$$file.sc*; \
	done
	$(RM) -f $(RUNTIME_SRC_DIR)/Mlib/*.zi
	$(RM) -f $(CAML_SRC_DIR)/*.zi
	$(RM) -f $(CAML_SRC_DIR)/*.lam
	$(RM) -f $(MY_LIB)/*.zi
	$(RM) -f $(RUNTIME_SRC_DIR)/Mlib/*.sci
	$(RM) -f $(RUNTIME_SRC_DIR)/Mlib/*.scm
	$(RM) -f $(RUNTIME_SRC_DIR)/Mlib/*.lam
	$(RM) -f $(BIN)/camloo
	$(RM) -f $(BIN)/camloo.ok

cleanall: bootstrap-clean # api-cleanall 

distclean: cleanall

#*---------------------------------------------------------------------*/
#  Additional rules                                                    */
#*---------------------------------------------------------------------*/
$(EXEC): $(OBJECTS)
	mkdir -p $(BIN)
	$(BIGLOO) $(EFLAGS) $(BAPIFLAGS) -copt $(CPICFLAGS) -copt "$(CEFLAGS)" $^ -o $(BIN)/$@

$(MY_LIB)/%.zi: $(RUNTIME_SRC_DIR)/Mlib/%.mli
	$(BIN)/$(EXEC) -stop -zi -mlopt "-O none -include $(MY_LIB)" $< -o $@
	mv -f $(RUNTIME_SRC_DIR)/Mlib/$*.zi $(MY_LIB)

include $(DEFAULT_LIB_DIR)/Makefile.api