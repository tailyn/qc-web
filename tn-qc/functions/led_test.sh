#!/bin/sh

while true; do

#PWR LED
 sh -c 'echo 1 > /sys/class/gpio/gpio96/value'
res=$( sh -c 'cat /sys/class/gpio/gpio96/value')

if [[ "$res" == "1" ]]; then
	sleep 0.2
	 sh -c 'echo 0 > /sys/class/gpio/gpio96/value'

	#WLAN LED
	 sh -c 'echo 0 > /sys/class/gpio/gpio103/value'
	res=$( sh -c 'cat /sys/class/gpio/gpio103/value')

	if [[ "$res" == "0" ]]; then
		sleep 0.2
		 sh -c 'echo 1 > /sys/class/gpio/gpio103/value'

		#APP LED
		 sh -c 'echo 0 > /sys/class/gpio/gpio104/value'
		res=$( sh -c 'cat /sys/class/gpio/gpio104/value')

		if [[ "$res" == "0" ]]; then
			sleep 0.2
			 sh -c 'echo 1 > /sys/class/gpio/gpio104/value'
			echo "Pass" > results/LED/result.txt
		else
			 sh -c 'echo 1 > /sys/class/gpio/gpio104/value'
			echo "Failed" > results/LED/result.txt
		fi
	else
		 sh -c 'echo 1 > /sys/class/gpio/gpio103/value'
		echo "Failed" > results/LED/result.txt
	fi


else
	 sh -c 'echo 0 > /sys/class/gpio/gpio96/value'
	echo "Failed" > results/LED/result.txt
fi

sleep 2
done
