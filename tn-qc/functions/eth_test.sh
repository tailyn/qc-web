#!/bin/sh

while true; do

if [[ "$(ifconfig | grep eth0)" ]]; then
        echo "Pass" > results/Ethernet/result.txt
else
        echo "Failed" > results/Ethernet/result.txt
fi

sleep 2
done
