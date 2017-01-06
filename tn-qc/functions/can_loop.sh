#!/bin/sh

ip link set can0 type can bitrate 50000;ifconfig can0 up
candump can0 > results/CAN_bus/can_bus.log &

while true;do

if [[ "$(cat results/CAN_bus/can_bus.log | grep "DE AD BE EF")" ]]; then
  cansend can0 5AA#

fi
> results/CAN_bus/can_bus.log
sleep 2

done
