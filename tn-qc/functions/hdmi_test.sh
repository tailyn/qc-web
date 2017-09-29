#!/bin/sh

while true; do

if [[ "$(i2cdump -f -y 1 0x50 | grep 'XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX')" ]]; then
        echo "Failed" > results/HDMI/result.txt
else
        echo "Pass" > results/HDMI/result.txt
fi

done

