#!/bin/sh

echo "out" > /sys/class/edm/gpio/GPIO_5V1/direction
echo "out" > /sys/class/edm/gpio/GPIO_5V3/direction

while true; do

echo "1" > /sys/class/edm/gpio/GPIO_5V1/value
echo "1" > /sys/class/edm/gpio/GPIO_5V3/value

if [[ "$( cat /sys/class/edm/gpio/GPIO_5V4/value )" == "1" ]]; then
	sleep 1
	echo "0" > /sys/class/edm/gpio/GPIO_5V3/value
	if [[ "$( cat /sys/class/edm/gpio/GPIO_5V4/value )" == "0" ]]; then

		if [[ "$( cat /sys/class/edm/gpio/GPIO_5V2/value )" == "1" ]]; then
		        sleep 1                                                            
        		echo "0" > /sys/class/edm/gpio/GPIO_5V1/value
			if [[ "$( cat /sys/class/edm/gpio/GPIO_5V2/value )" == "0" ]]; then
				echo "Pass" > results/GPIO/result.txt
			else
				echo "Failed" > results/GPIO/result.txt
			fi
		else
			echo "Failed" > results/GPIO/result.txt
		fi
	else
		echo "Failed" > results/GPIO/result.txt
	fi
else
	echo "Failed" > results/GPIO/result.txt
fi

sleep 2
done
