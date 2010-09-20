EXAMPLES = docteur grep hop pascal scheme+ml+c

all:
	for i in $(EXAMPLES); do (cd $$i; $(MAKE) all); done

clean:
	for i in $(EXAMPLES); do (cd $$i; $(MAKE) clean && rm -f *.pragma); done