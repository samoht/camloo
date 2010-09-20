SUCCESS = cells simple_pair hash print str match
FAIL	= exc

.PHONY: all
all: $(SUCCESS)
	for test in $(SUCCESS); do ./$$test; done;

fail: $(FAIL)
	for test in $(FAIL); do ./$$test; done;

clean: $(SUCCESS:%=%.clean) $(FAIL:%=%.clean)

include ../Makefile.camloo
