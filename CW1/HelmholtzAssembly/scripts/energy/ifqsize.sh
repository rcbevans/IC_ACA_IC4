#!/bin/bash

for x in 1 2 4 8 16
do
	echo -n $x " "
	args="-fetch:ifqsize $x"
	./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
done