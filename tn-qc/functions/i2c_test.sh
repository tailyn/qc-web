#!/bin/sh

while true; do

if [[ "$(i2cdetect -y -r 1)" ]]; then
        echo "Pass" > results/I2C1/result.txt
else
        echo "Failed" > results/I2C1/result.txt
fi

sleep 2
done
