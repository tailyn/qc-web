#!/bin/sh

while true; do

if [[ "$(memtester 1 1)" ]]; then
	echo "Pass" > results/Memory/result.txt
	memtester 1600
else
	echo "Failed" > results/Memory/result.txt
fi

done
