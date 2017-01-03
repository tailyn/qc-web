#!/bin/sh

KIM_PATH=/sys/devices/soc0/kim/

uim -f "$KIM_PATH" &
sleep 0.3

modprobe st_drv
modprobe btwilink
sleep 0.2

while true; do

if [[ "$(hciconfig | grep "hci")" ]]; then
	echo "Pass" > results/Bluetooth/result.txt
else
	echo "Failed" > results/Bluetooth/result.txt
fi

sleep 2

done
