#!/bin/bash

for x in 1 2 3 4
do
	echo -n $x " "
	args="-bpred nottaken -issue:inorder true -issue:wrongpath false -res:fpalu 1 -res:fpmult 1 -res:ialu 1 -res:imult 1 -fetch:ifqsize 1 -decode:width 1 -issue:width 1 -commit:width 1 -ruu:size 4 -lsq:size 4"
	./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
done

#400870064.6313
#332072474.7684
#355113945.8918
#334545228.2321
#332072455.2292


#DEFAULT: 524093429.3110