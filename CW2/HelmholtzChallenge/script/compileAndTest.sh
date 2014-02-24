#!/bin/bash

echo "Compiling Source"
make -B all;
echo "Running HelmHoltz"
./bin/ACA2-2014 ../HelmholtzMeshes/small;
echo "Verifying Correctness LHS"
./bin/compare_dat lhs_out ../HelmholtzMeshes/lhs_out-small-reference.txt;
echo "Verifying Correctness RHS"
./bin/compare_dat rhs_out ../HelmholtzMeshes/rhs_out-small-reference.txt;