#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Running only Sequential prefetcher, tracer and from_file prefetcher"
	./build_champsim.sh bimodal no no no no lru 1 sp simple
	./build_champsim.sh bimodal no no no no lru 1 from_file_sp file
	./run_champsim.sh sp-simple-bimodal-no-no-no-no-lru-1core 1 10 srv_12 simple
	./run_champsim.sh from_file_sp-file-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file
elif [ "$#" -eq 1 ]; then
	elif [ "$1" = "all" ]; then
	    echo "Running everything"
		./build_champsim.sh bimodal no no no no lru 1 sp simple
		./build_champsim.sh bimodal no no no no lru 1 from_file_sp file
		./build_champsim.sh bimodal no no no no lru 1 from_file_sp_combo from_file_sp_w_combo

		./run_champsim.sh sp-simple-bimodal-no-no-no-no-lru-1core 1 10 srv_12 simple
		./run_champsim.sh from_file_sp-file-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file
		./run_champsim.sh from_file_sp_combo-from_file_sp_w_combo-bimodal-no-no-no-no-lru-1core 1 10 srv_12 file_combo 
	fi
else
	echo "Too many arguments"
fi

