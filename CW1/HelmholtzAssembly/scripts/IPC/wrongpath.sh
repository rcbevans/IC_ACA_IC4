#!/bin/bash

for x in 'false' 'true'
do
	echo -n $x " "
	args="-issue:wrongpath $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done