#!/bin/sh

while true; do

if [[ "$(memtester 1 1)" ]]; then
	echo "Pass" > results/Memory/result.txt
else
	echo "Failed" > results/Memory/result.txt
fi

sleep 2
done
