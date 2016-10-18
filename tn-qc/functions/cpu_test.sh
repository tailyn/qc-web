#!/bin/bash


cpu_speed=$(mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12"%" }')

if [[ "$cpu_speed" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
