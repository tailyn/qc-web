#!/bin/sh

while true; do

if [[ "$(dmesg | grep ata1.00)" ]]; then
        echo "Pass" > results/SATA/result.txt
else
        echo "Failed" > results/SATA/result.txt
fi

sleep 2
done

