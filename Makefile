# Top-level Makefile; the hard work is done in :
#
# * src/runtime/Makefile for the camloo-runtime library
# * src/camloo/Makefile  for the camloo library
#

DEFAULT_LIB_DIR = $(shell bigloo -q -eval "(begin (print *default-lib-dir*) (exit 0))")
include $(DEFAULT_LIB_DIR)/Makefile.config
BOOTLIBDIR=`pwd`/lib

#*---------------------------------------------------------------------*/
#*    all                                                              */
#*---------------------------------------------------------------------*/
.PHONY: all build build-c build-jvm build-dotnet bootstrap

all: build
boot: build
build: build-c

c: build-c
jvm: build-jvm
dotnet: build-dotnet

build-c:
	if [ "$(NATIVEBACKEND)" = "yes" ]; then \
		echo "[0m[1;32m>>> C[0m" && \
		(	cd src/runtime && $(MAKE) c ) && \
		export LD_LIBRARY_PATH=$(BOOTLIBDIR) && \
		export DYLD_LIBRARY_PATH=$(BOOTLIBDIR) && \
		(	cd src/camloo  && \
			$(MAKE) c && \
			$(MAKE) exec && \
			$(MAKE) zi ); \
	fi

build-jvm:
	echo "CAMLOO .jvm: Not implemented";

build-jvm.not-implemented:
	if [ "$(JVMBACKEND)" = "yes" ]; then \
		echo "[0m[1;31m>>> JVM[0m"; \
		(cd src/runtime && $(MAKE) jvm); \
		(cd src/camloo  && $(MAKE) jvm); \
	fi

build-dotnet:
	echo "CAMLOO .net: Not implemented";

build-dotnet.not-implemented:
	if [ "$(DOTNETBACKEND)" = "yes" ]; then \
		echo "[0m[1;31m>>> .NET[0m"; \
		(cd src/runtime && $(MAKE) dotnet); \
		(cd src/camloo  && $(MAKE) dotnet); \
	fi

bootstrap:
	(cd src/camloo  && $(MAKE) bootstrap) && \
	(cd src/runtime && $(MAKE) bootstrap)

bootstrap-recover:
	(cd src/camloo  && $(MAKE) bootstrap-recover)
	(cd src/runtime && $(MAKE) bootstrap-recover)

tests:
	(cd benchmarks && $(MAKE) all)
	(cd recette    && $(MAKE) all)
	(cd examples   && $(MAKE) all)

#*---------------------------------------------------------------------*/
#*    Clean                                                            */
#*---------------------------------------------------------------------*/
.PHONY: clean distclean cleanall

clean:
	(cd src/runtime && $(MAKE) clean)
	(cd src/camloo  && $(MAKE) clean)
	(cd benchmarks  && $(MAKE) clean)
	(cd examples    && $(MAKE) clean)
	(cd recette     && $(MAKE) clean)

distclean: clean
	(cd src/runtime && $(MAKE) distclean)
	(cd src/camloo  && $(MAKE) distclean)

cleanall: distclean
	(cd src/runtime && $(MAKE) cleanall)
	(cd src/camloo  && $(MAKE) cleanall)
	$(RM) -f lib/*camloo* >/dev/null 2>&1
	(find -iname "*~" | xargs $(RM) >/dev/null 2>&1)

#*---------------------------------------------------------------------*/
#*    Installation                                                     */
#*---------------------------------------------------------------------*/
.PHONY: install uninstall

install:
	(cd src/runtime && $(MAKE) install) && \
	(cd src/camloo  && $(MAKE) install) && \
	cp Makefile.camloo $(LIBDIR)/camloo


uninstall:
	(cd src/runtime && $(MAKE) uninstall) && \
	(cd src/camloo  && $(MAKE) uninstall)

#*---------------------------------------------------------------------*/
#*    distrib                                                          */
#*---------------------------------------------------------------------*/
distrib:
	(cd src/runtime && $(MAKE) ude)
	(cd src/camloo  && $(MAKE) ude)
