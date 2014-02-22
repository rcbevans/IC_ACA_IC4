#!/bin/bash

for x in 2 4 8 16 32 64 128 256
do
	echo -n $x " "
	args="-lsq:size $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done