TESTS = ffib \
		life \
		queens \
		quicksort \
		takc \
		taku \
		boyer \
		kb

# The files needed to build to the boyer's test
BOYER_FILES = terms.ml rules.ml boyer.ml

# Name of the output file
PERFS  = PERFS



# -----------------------------------------------------------
#
# -----------------------------------------------------------

_TESTS = $(foreach test, $(TESTS), $(test)/$(test))
CLEANS = $(_TESTS:%=%.clean)
RTESTS = $(_TESTS:%=%.test)

.PHONY:all
all: $(_TESTS)
	@-\rm -f PERFS
	@-echo "---------------------------" > PERFS
	@-date >> PERFS
	@-uname -a >> PERFS
	@-bigloo -query >> PERFS
	@-echo "---------------------------" >> PERFS
	$(MAKE) $(RTESTS)
	@-echo "---------------------------" >> PERFS

_BOYER_FILES= $(BOYER_FILES:%=boyer/bigloo/%)

%.test: %
	echo $* >> PERFS
	$*
	(time $* > /dev/null) 2>> PERFS

boyer/boyer: $(_BOYER_FILES)
	$(MAKE) FILES="$(_BOYER_FILES)" TARGET=$@ build

boyer/boyer.clean:
	rm -f boyer/boyer
	rm -f boyer/bigloo/*.lam boyer/bigloo/*.scm boyer/bigloo/*.o boyer/bigloo/*.zi boyer/bigloo/*.c boyer/bigloo/*.pragma

clean: $(CLEANS)
	rm -f $(_TESTS)

include ../Makefile.camloo