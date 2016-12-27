#!/bin/sh

while true; do

if [[ "$(dmesg | grep mmcblk0)" ]]; then
        echo "Pass" > results/SD/result.txt
else
        echo "Failed" > results/SD/result.txt
fi

sleep 2
done
