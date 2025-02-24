#!/bin/bash

# Get the latest run name from nextflow log
latest_run=$(nextflow log | awk 'NR>1 {print $1, $2, $4}' | sort -k1,1 -k2,2 | tail -n 1 | awk '{print $3}')

# Run nextflow log with filters for the latest run
if [[ -n "$latest_run" ]]; then
    echo "Latest run: $latest_run"
    nextflow log "${latest_run}" -f name,stderr,workdir -F "status == 'FAILED'"
else
    echo "No valid runs found."
fi
