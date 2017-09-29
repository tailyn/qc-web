#!/bin/sh

candump can0 > results/CAN_bus/can_bus_rx.log &
can_ps=$(ps aux | grep "candump" | head -1 | awk '{print $2}')

sleep 2
cansend can0 123#DEADBEEF

while true; do

	if [[ "$(cat results/CAN_bus/can_bus_rx.log | grep "DE AD BE EF")" ]]; then
		echo "Pass" > results/CAN_bus/result.txt
                rm results/CAN_bus/can_bus_rx.log
		kill $can_ps
		candump can0 > results/CAN_bus/can_bus_rx.log &
		can_ps=$(ps aux | grep "candump" | head -1 | awk '{print $2}')
		cansend can0 123#DEADBEEF
        else
                echo "Failed" > results/CAN_bus/result.txt
        fi
	
sleep 5

done
