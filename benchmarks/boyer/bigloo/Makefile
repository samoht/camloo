CAMLC=bigloo
OBJS=terms.o rules.o boyer.o
BFLAGS=-v -unsafe -O3 -copt "-O2 -fomit-frame-pointer" -extend caml
DEST="a.out"

all: boyer

boyer: $(OBJS)
	$(CAMLC) -o $(DEST) $(OBJS) $(BFLAGS)

clean:
	rm -f $(DEST) *.zi *.o

.SUFFIXES:
.SUFFIXES: .ml .o .mli .zi

.ml.o:
	$(CAMLC) -A $(BFLAGS) $<

.mli.zi:
	$(CAMLC) -A $(BFLAGS) $<

boyer.o: boyer.ml rules.o terms.o 
rules.o: rules.ml terms.o 
terms.o: terms.ml 
