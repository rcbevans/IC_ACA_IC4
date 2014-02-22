#!/bin/bash

#vary bpred
for x in 'false' 'true'
do
	echo -n $x " "
	args="-issue:inorder $x"
	./run-simplescalar.sh "$args" 2>&1 | grep "# instructions per cycle"
done