#!/bin/bash

for x in 1 2 4 8 16
do
	echo -n $x " "
	args="-fetch:ifqsize $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done