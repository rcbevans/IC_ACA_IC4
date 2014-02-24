C = gcc
CPP = g++
SRC = src/helmholtz.c src/gettimemicroseconds.c src/utils.c src/wrappers_kernels.c
CFLAGS = -O3 -std=c99
LIBS = -lrt -lm

all: bin/compare_dat bin/ACA2-2014

bin/ACA2-2014:	src/helmholtz.c
	$(C) $(CFLAGS) -o $@ $(SRC) $(LIBS)

bin/compare_dat:    script/compare.cpp
	$(CPP) script/compare.cpp -o $@ -lstdc++

clean:
	rm -f bin/compare_dat compare_bin bin/ACA2-2014

.PHONY: all clean