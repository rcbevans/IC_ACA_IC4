#!/bin/bash

#vary bpred
for x in 'nottaken' 'taken' 'perfect' 'bimod' '2lev' 'comb'
do
	echo -n $x " "
	args="-bpred $x"
	./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
done