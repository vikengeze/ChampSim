#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Running only Sequential prefetcher, tracer and from_file prefetcher"
    ./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer
	./build_champsim.sh bimodal no no no no lru 1 sp simple
	./build_champsim.sh bimodal no no no no lru 1 from_file_sp file
	./run_champsim.sh sp-simple-bimodal-no-no-no-no-lru-1core 1 10 srv_12 simple
	./run_champsim.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 10 srv_12 trace
	./run_champsim.sh from_file_sp-file-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file
elif [ "$#" -eq 1 ]; then
	if [ "$1" = "tracing" ]; then 
	    echo "Running only tracer and SP tracer combo(creating test.txt and test2.txt files"
		./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer
		./build_champsim.sh bimodal no no no no lru 1 sp_tracer tracer_combo
		./run_champsim.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 10 srv_12 trace
		./run_champsim.sh sp_tracer-tracer_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 sp_trace_combo
	elif [ "$1" = "all" ]; then
	    echo "Running everything"
		./build_champsim.sh bimodal no no no no lru 1 sp simple
		./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer
		./build_champsim.sh bimodal no no no no lru 1 from_file_sp file
		./build_champsim.sh bimodal no no no no lru 1 sp_tracer tracer_combo
		./build_champsim.sh bimodal no no no no lru 1 from_file_sp_combo from_file_sp_w_combo

		./run_champsim.sh sp-simple-bimodal-no-no-no-no-lru-1core 1 10 srv_12 simple
		./run_champsim.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 10 srv_12 trace
		./run_champsim.sh from_file_sp-file-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file
		./run_champsim.sh sp_tracer-tracer_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 sp_trace_combo
		./run_champsim.sh from_file_sp_combo-from_file_sp_w_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file_combo 
	fi
else
	echo "Too many arguments"
fi

