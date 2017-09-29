#!/bin/sh

while true; do

if [[ "$(dmesg | grep 'console=ttymxc3')" ]]; then
        echo "Pass" > results/UART4/result.txt
else
        echo "Failed" > results/UART4/result.txt
fi

sleep 2
done

