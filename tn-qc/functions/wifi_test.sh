#!/bin/sh

while true; do

if [[ "$(iw dev wlan0 scan | grep "TAILYN-MIS")" ]]; then
	echo "Pass" > results/Wifi/result.txt
else
	echo "Failed" > results/Wifi/result.txt
fi

sleep 2
done
