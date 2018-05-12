#!/bin/bash

for ((i=1;i<=12;i=i+1))
do
    echo "num threads= $i"
    export OMP_NUM_THREADS=$i
    ./pmm-OpenMP 100
    ./pmm-OpenMP 1500
done
