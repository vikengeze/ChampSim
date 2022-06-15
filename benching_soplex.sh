#!/bin/bash

fp='/home/sonqo/Desktop/Diplom/traces_gap/450*s0*'

for trace in $fp; do
	echo "Starting on trace file $(basename $trace)..."
	./benchmark.sh $trace
	echo "Done with trace file $(basename $trace)"
done