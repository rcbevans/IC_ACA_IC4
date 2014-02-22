#!/bin/bash

for x in 1 2 4 8
do
	echo -n $x " "
	args="-res:memport $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done