#!/bin/bash
max=12
for (( i=1; i <= $max; ++i))
do
    echo "Con $i threads: " >> datosAtc.txt
    export OMP_NUM_THREADS=$i
    for((j=1000; j<=10000; j=j+1000))
    do
      ./pmv-OpenMP-reduction $j >> datosAtc.txt
    done
done
