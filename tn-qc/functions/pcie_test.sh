#!/bin/sh

while true; do

if [[ "$(lsusb | grep "05c6:9003")" ]]; then
	echo "Pass" > results/mPCIE/result.txt
else
	echo "Failed" > results/mPCIE/result.txt
fi

sleep 2
done
