#!/bin/sh

while true; do

if [[ "$(dmesg | grep "Mass Storage")" ]]; then
	if [[ "$(cat /proc/partitions | grep "sd")" ]]; then
        	echo "Pass" > results/USB/result.txt
	else
        	echo "Failed" > results/USB/result.txt
	fi
else
	echo "Failed" > results/USB/result.txt
fi

sleep 2
done
