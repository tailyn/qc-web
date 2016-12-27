#!/bin/sh

while true; do

if [[ "$(dmesg | grep "IP175C")" ]]; then
	echo "Pass" > results/Switch_LAN/result.txt
else
	echo "Failed" > results/Switch_LAN/result.txt
fi

sleep 2
done
