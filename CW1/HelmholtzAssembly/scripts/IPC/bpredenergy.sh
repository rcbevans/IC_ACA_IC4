#!/bin/bash

#vary bpred
for x in 'nottaken' 'taken' 'perfect' 'bimod' '2lev' 'comb'
do
	echo -n $x " "
	args="-bpred $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done