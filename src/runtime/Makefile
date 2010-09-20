DEFAULT_LIB_DIR = $(shell bigloo -q -eval "(begin (print *default-lib-dir*) (exit 0))")

include $(DEFAULT_LIB_DIR)/Makefile.config
include $(DEFAULT_LIB_DIR)/Makefile.misc

MAKEFILE_CAMLOO = ../../Makefile.camloo 
CAMLOO_LIBDIR	= $(LIBDIR)/camloo

#*---------------------------------------------------------------------*/
#*    Compilers, Tools and Destinations                                */
#*---------------------------------------------------------------------*/
# the library name
API				= camloo-runtime
# Directories
LIB				= $(BOOTLIBDIR)
BIGLOO_SRC_DIR  = Llib
BIGLOO_BSRC_DIR = Llib.bootstrap
C_SRC_DIR		= Clib
CAML_SRC_DIR	= Mlib
MISC_SRC_DIR    = Misc
# The Bigloo compiler
BIGLOO			= $(BGLBUILDBIGLOO)
AFILE			= $(BGLBUILDBINDIR)/$(AFILE_EXE)
JFILE			= $(BGLBUILDBINDIR)/$(JFILE_EXE)
DEPEND			= $(BGLBUILDBINDIR)/$(BDEPEND_EXE)
BTAGS			= $(BGLBUILDBINDIR)/$(BTAGS_EXE)
# Bigloo compilation options
BAPIFLAGS		= $(BFLAGS) -I $(BIGLOO_SRC_DIR) -lib-dir $(LIB) \
				  -srfi $(API) -rm -unsafe -safee
# Flags to build a heap
BHEAPFLAGS		= -unsafe -q -mkaddheap -mkaddlib -L $(LIB) -I $(BIGLOO_SRC_DIR) \
				  -heap-library $(API) -srfi $(API)

#*---------------------------------------------------------------------*/
#*    Scheme extended objects                                          */
#*---------------------------------------------------------------------*/
_BGL_OBJECTS    = \
	bfloat bint bio bmisc bstring bconstr handle intext \
	bsys tag

_BGL_BOOTSTRAP_OBJECTS	= \
	arg filename int parsing sort baltree float io   \
	printexc stack char fstring lexing printf stream \
	eq fvect list queue string exc genlex map random \
	vect fchar hashtbl pair set

_C_OBJECTS	= \
	alloc floats hash clexing str constr ints cstring fail \
	cio cparsing sys

_OBJECTS		=	$(_C_OBJECTS) $(_BGL_OBJECTS) $(_BGL_BOOTSTRAP_OBJECTS)
OBJECTS			= 	$(_OBJECTS:%=objs/%.o)

EOBJECTS		= 	objs/make_lib.o

REBUILD_TARGET 	= 	$(_BGL_BOOTSTRAP_OBJECTS:%=$(CAML_SRC_DIR)/%.sci) \
					$(_BGL_BOOTSTRAP_OBJECTS:%=$(CAML_SRC_DIR)/%.scm)

_BGL_SOURCES	= $(_BGL_OBJECTS:%=$(BIGLOO_SRC_DIR)/%.scm) \
				  $(_BGL_BOOTSTRAP_OBJECTS:%=$(BIGLOO_BSRC_DIR)/%.scm)

#*---------------------------------------------------------------------*/
#*    all                                                              */
#*---------------------------------------------------------------------*/
.PHONY: all bootstrap c

all: c

bootstrap:
	$(MAKE) && \
	if [ -e $(BIGLOO_BSRC_DIR).ok ]; then \
		rm -rf $(BIGLOO_BSRC_DIR).ok; \
	fi && \
	cp -r  $(BIGLOO_BSRC_DIR) $(BIGLOO_BSRC_DIR).ok && \
	(	make -f $(MAKEFILE_CAMLOO) CAMLOO_FLAGS="--bootstrap" AFILE="afile-bootstrap" $(REBUILD_TARGET) && \
		mkdir -p $(BIGLOO_BSRC_DIR) && \
		cp $(CAML_SRC_DIR)/*.scm $(BIGLOO_BSRC_DIR) && \
		cp $(CAML_SRC_DIR)/*.sci $(BIGLOO_BSRC_DIR) && \
		$(MAKE) api-c ) \
	|| $(MAKE) bootstrap-recover

bootstrap-recover:
	if [ -e $(BIGLOO_BSRC_DIR).ok ]; then \
		rm -rf $(BIGLOO_BSRC_DIR) && \
		cp -r $(BIGLOO_BSRC_DIR).ok $(BIGLOO_BSRC_DIR); \
	fi

c:
	for file in $(_BGL_BOOTSTRAP_OBJECTS); do \
		if [ -e $(BIGLOO_BSRC_DIR)/$$file.sci ]; then \
			ln -f -s ../$(BIGLOO_BSRC_DIR)/$$file.sci $(BIGLOO_SRC_DIR); \
		fi; \
		ln -f -s ../$(BIGLOO_BSRC_DIR)/$$file.scm $(BIGLOO_SRC_DIR); \
	done
	$(MAKE) api-c

$(MISC_SRC_DIR)/$(API).init: $(MISC_SRC_DIR)/$(API).init.in .afile
	cp $< $@ 
# TODO: use a configure file
#	@ echo "*** ERROR: $@ is out of date (older than $?)"
#	@ echo "You need to re-configure \"(cd ..; ./configure --bootconfig)\""
#	@ exit 1

#*---------------------------------------------------------------------*/
#* install                                                             */
#*---------------------------------------------------------------------*/
.PHONY: install uninstall

CP = cp --force #--backup

install: api-install-init
	mkdir -p $(CAMLOO_LIBDIR) && \
	$(CP) $(C_SRC_DIR)/*.h $(CAMLOO_LIBDIR)/ && \
	chmod $(MODFILE) $(CAMLOO_LIBDIR)/*.h && \
	if [ -e $(CAML_SRC_DIR)/list.pragma ]; then \
		$(CP) $(CAML_SRC_DIR)/*.pragma $(CAMLOO_LIBDIR)/ && \
		chmod $(MODFILE) $(CAMLOO_LIBDIR)/*.pragma ; \
	fi && \
	$(MAKE) api-install-c

uninstall: api-uninstall-init api-uninstall-c
	$(RM) -rf $(CAMLOO_LIBDIR)/

#*---------------------------------------------------------------------*/
#*    clean                                                            */
#*---------------------------------------------------------------------*/
bootstrap-clean:
	$(RM) -f $(CAML_SRC_DIR)/*.zi
	$(RM) -f $(CAML_SRC_DIR)/*.scm
	$(RM) -f $(CAML_SRC_DIR)/*.sci
	$(RM) -f $(CAML_SRC_DIR)/*.lam
	$(RM) -rf $(BIGLOO_BSRC_DIR).ok/

clean: api-clean
	for file in $(_BGL_BOOTSTRAP_OBJECTS); do \
		$(RM) -f  $(BIGLOO_SRC_DIR)/$$file.sc*; \
	done

cleanall: api-cleanall bootstrap-clean

distclean: cleanall

include $(DEFAULT_LIB_DIR)/Makefile.api