#!/bin/sh

while true; do

if [[ "$(ifconfig | grep "can0")" ]]; then
	echo "Pass" > results/CAN_bus/result.txt
else
	echo "Failed" > results/CAN_bus/result.txt
fi

sleep 2

done
