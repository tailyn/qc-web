#!/bin/sh

ip link set can0 type can bitrate 50000;ifconfig can0 up
candump can0 > results/CAN_bus/can_bus_rx.log &

while true; do

if [[ "$(ifconfig | grep "can0")" ]]; then
	cansend can0 123#DEADBEEF
	sleep 3
	if [[ "$(cat results/CAN_bus/can_bus_rx.log | grep "5AA")" ]]; then
                echo "Pass" > results/CAN_bus/result.txt
        else
                echo "Failed" > results/CAN_bus/result.txt
        fi
		> results/CAN_bus/can_bus_rx.log
	
else
	echo "Failed" > results/CAN_bus/result.txt
fi

sleep 1

done
