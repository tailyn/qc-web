#!/bin/sh

while true; do

if [[ "$(hciconfig | grep "BD Address:" | awk '{print $3}')" == "00:00:00:00:00:00" ]]; then
	echo "Failed" > results/Bluetooth/result.txt
else
	echo "Pass" > results/Bluetooth/result.txt
fi

sleep 2

done
