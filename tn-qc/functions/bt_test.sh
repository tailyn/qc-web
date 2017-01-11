#!/bin/sh

modprobe btwilink
sleep 1
uim &
sleep 10
hciconfig hci0 up
sleep 1
while true; do

if [[ "$(hciconfig | grep "hci")" ]]; then
	echo "Pass" > results/Bluetooth/result.txt
else
	echo "Failed" > results/Bluetooth/result.txt
fi

sleep 2

done
