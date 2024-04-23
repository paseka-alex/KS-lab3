#!/bin/bash
cat /proc/cpuinfo | grep flag | head -1
cd /home/grid/testbed/tb191/Lab/vec_samples/src 
ml icc
arr=( "-xSSE2" "-xSSE3" "-xAVX"  )
for j in "${arr[@]}"; do
  for i in {1..3}; do
    x1=$(date +%M)
    x2=$(date +%S)
    echo icpc -std=c++17 -O$i $j LAB3.cpp -o go-$x1-$x2
    icpc -std=c++17 -O$i $j LAB3.cpp -o go-$x1-$x2
    echo "$j $i:"
    time ./go-$x1-$x2
  done 
done
