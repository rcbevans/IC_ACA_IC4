#!/bin/bash

for x in 2 4 8 16 32 64 128 256
do
  echo -n $x " "
  args="-ruu:size $x"
  ./run-wattch.sh "$args" 2>&1 | grep sim_IPC
done
