#!/bin/bash

for x in 1 2 4 8
do
	echo -n $x " "
	args="-res:fpmult $x"
	./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
done