#!/bin/bash
TRACE_DIR='/home/sonqo/Desktop/Διπλωματικη/paper-47-AE/traces'

binary=${1}
binary=${1}
n_warm=${2}
n_sim=${3}
trace=${4}
option=${5}
extra=${6}

DESTINATION_FOLDER='statistics'
mkdir -p ${DESTINATION_FOLDER}/${option}

(./bin/${binary} -warmup_instructions ${n_warm}000000 -simulation_instructions ${n_sim}000000 ${extra} -traces ${TRACE_DIR}/${trace}.champsimtrace.xz) &> ${DESTINATION_FOLDER}/${option}/${trace}_${n_sim}M_trace.txt
