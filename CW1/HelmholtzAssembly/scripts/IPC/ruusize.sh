#!/bin/bash

#vary ruu:size
for x in 2 4 8 16 32 64 128 256
do
	echo -n $x " "
	args="-ruu:size $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done