#!/bin/bash

./build_champsim.sh bimodal no no no no lru 1 trace stlb_tracer
./build_champsim.sh bimodal no no no no lru 1 sp simple
./build_champsim.sh bimodal no no no no lru 1 from_file_sp file

echo "Running sims for all binaries"
./run_champsim.sh sp-simple-bimodal-no-no-no-no-lru-1core 1 10 srv_12 simple
echo "Sequential prefetcher is done"
./run_champsim.sh trace-stlb_tracer-bimodal-no-no-no-no-lru-1core 1 10 srv_12 trace
echo "Tracer is done"
./run_champsim.sh from_file_sp-file-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file
echo "File prefetcher is done"

if [ "$#" -eq 1 ]; then
    echo "Running extra simulation for stlb_tracer and file prefetcher"
	./build_champsim.sh bimodal no no no no lru 1 sp_tracer tracer_combo
	./run_champsim.sh sp_tracer-tracer_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 sp_trace_combo
    echo "Tracing is done, starting final sim"
	./build_champsim.sh bimodal no no no no lru 1 from_file_sp_combo from_file_sp_w_combo
    ./run_champsim.sh from_file_sp_combo-from_file_sp_w_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file_combo
fi