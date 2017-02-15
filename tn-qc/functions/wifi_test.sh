#!/bin/sh

sleep 1
modprobe wlcore_sdio
sleep 0.1
modprobe wl18xx
sleep 0.5
ifconfig wlan0 up
sleep 1
modprobe btwilink
uim &
sleep 5
hciconfig hci0 up

while true; do

if [[ "$(iw dev wlan0 scan | grep "TAILYN-MIS")" ]]; then
	echo "Pass" > results/Wifi/result.txt
else
	echo "Failed" > results/Wifi/result.txt
fi

sleep 2
done
