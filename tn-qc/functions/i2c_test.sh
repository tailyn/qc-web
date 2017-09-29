#!/bin/sh

echo "1" > /sys/class/edm/gpio/I2C_EXP_PWR/value
sleep 3;

while true; do

if [[ "$(i2cdetect -y -r 2 | grep "50:" | awk '{print $3}')" == "51" ]]; then
	echo "Pass" > results/I2C/result.txt
else
	echo "Failed" > results/I2C/result.txt
fi

sleep 2
done
