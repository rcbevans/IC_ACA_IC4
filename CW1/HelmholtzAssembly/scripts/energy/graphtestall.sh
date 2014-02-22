#!/bin/bash

count=0

echo -n $count " default "
args=""
./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
let count++

echo -n $count " optimal "
args="-issue:width 1 -commit:width 1 -fetch:ifqsize 1 -decode:width 1 -res:ialu 1 -res:imult 1 -res:fpalu 1 -res:fpmult 1 -bpred nottaken -issue:inorder true -issue:wrongpath false -ruu:size 4 -lsq:size 4"
./run-wattch.sh "$args" 2>&1 | grep "# total power per cycle_cc1"
let count++