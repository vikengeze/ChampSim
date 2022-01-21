#!/bin/bash

TRACES='srv_12'

if [ $# -eq 1 ]; then
	INSTR_NUM=$1
else
	INSTR_NUM=10
fi

echo "Rebuilding tracing binary ..."
./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer > /dev/null
for trace in ${TRACES}; do
	echo "Creating trace file for application $trace and $INSTR_NUM million isntructions ..."
	./run_champsim.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 $INSTR_NUM $trace traces
	echo "Done, results in statistics/traces/"$trace"_"$INSTR_NUM"M_trace.txt"
done