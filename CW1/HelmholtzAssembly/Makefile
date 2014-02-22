# Build the different binary versions we want for the set of code variants
#
# make  - make everything
# make x86  - make x86 binaries
# make simplescalar  - make simplscalar binaries
# make clean  - delete binaries
# make MYFLAGS=-DPRINT  - make everything with debug printing turned on
#
# Paul H J Kelly Imperial College London 2008
#
# Makefile structure from:
#  http://www.gnu.org/software/make/manual/html_node/make_44.html#SEC48
#

HDRS=gettimemicroseconds.h reference_element.h
SRC=Helmholtz_3Dmesh_poly3.c gettimemicroseconds.c

all: 	x86 simplescalar


################################################################
# Native linux x86

x86 : helmholtz.x86

helmholtz.x86 : $(SRC) Makefile
	gcc -o helmholtz.x86 -O3 -g -DITER=30 $(MYFLAGS) $(SRC)


################################################################
# Simplescalar

SSGCC=/homes/phjk/simplescalar/bin/gcc

simplescalar : helmholtz.ss

helmholtz.ss : $(SRC) Makefile
	$(SSGCC) -o helmholtz.ss -O3 -g -DITER=30 $(MYFLAGS) $(SRC)



################################################################
# This rule has to come last; it deletes all the binaries.
# If you define a new class of binaries, add it to this list
#
clean:	
	rm -f helmholtz.ss helmholtz.x86 $(OBJx86) $(OBJss)

.PHONY: all clean

