#!/bin/sh

candump can0 > results/CAN_bus/can_bus_rx.log &

while true; do

if [[ "$(ifconfig | grep "can0")" ]]; then
	cansend can0 123#DEADBEEF
	if [[ "$(cat results/CAN_bus/can_bus_rx.log | grep "5AA")" ]]; then
                > results/CAN_bus/can_bus_rx.log
                echo "Pass" > results/CAN_bus/result.txt
        else
                echo "Failed" > results/CAN_bus/result.txt
        fi
	
else
	echo "Failed" > results/CAN_bus/result.txt
fi

sleep 1

done
