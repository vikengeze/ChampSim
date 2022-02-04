#!/bin/bash

TRACE_FOLDERS='gap spec06 spec17'

if [ $# -eq 1 ]; then
	INSTR_NUM=$1
else
	echo "Running for 10 million isntructions... "
	INSTR_NUM=10
fi

echo "Rebuilding tracing binary ..."
./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer > /dev/null
for folder in ${TRACE_FOLDERS}; do
	echo "Starting on $folder folder..."
	fp='../ML-DPC/ChampSimTraces/'$folder'/*'
	for trace in $fp; do
		echo "Creating trace file for application $(basename "$trace") and $INSTR_NUM million isntructions ..."
		./run_champsim_ml.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 $INSTR_NUM $(basename "$trace") traces
		echo "Done, results in statistics/traces/"$(basename "$trace")"_"$INSTR_NUM"M_trace.txt"
	done
done