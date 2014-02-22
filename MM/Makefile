# Build the different binary versions we want for the set of code variants
#
# Paul H J Kelly Imperial College London 2005
#
# Makefile structure from:
#  http://www.gnu.org/software/make/manual/html_node/make_44.html#SEC48
#

SRC=MM1.c MM2.c MM3.c MM4.c 

all: 	x86 simplescalar


################################################################
# Native linux x86

OBJx86= $(SRC:.c=.x86)

x86: $(OBJx86) Makefile

$(OBJx86): %.x86: %.c
	gcc -o $@ -O1 -g -Wall $(MYFLAGS) $<


################################################################
# Simplescalar

SSGCC=/homes/phjk/simplescalar/bin/gcc

OBJss=$(SRC:.c=.ss)

simplescalar: $(OBJss) Makefile

$(OBJss): %.ss: %.c
	$(SSGCC) -o $@ -O3 -Wall $(MYFLAGS) $<



################################################################
# This rule has to come last; it deletes all the binaries.
# If you define a new class of binaries, add it to this list
#
clean:	
	rm -f $(OBJx86) $(OBJss)

.PHONY: all clean

