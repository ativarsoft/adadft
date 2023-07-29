GNAT?=gcc
GNATBIND?=gnatbind
GNATLINK?=gnatlink
GNATFLAGS?=

all: libadadft.a

libadadft.a: src/*.ad[s,b]
	mkdir -p obj
	$(GNAT) $(GNATFLAGS) -c -o obj/dft.o src/dft.adb
	ar cr adadft.a obj/dft.o
	ranlib adadft.a

clean:
	rm -fr obj
	rm -fr lib
	rm -f *.o
	rm -f *.a
	rm -f *.ali
	rm -f b~*.ad[b,s]
	rm -f b~*.ali

.PHONY: all clean

