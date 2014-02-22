#!/bin/bash

for x in 'false' 'true'
do
	echo -n $x " "
	args="-issue:wrongpath $x"
	./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
done