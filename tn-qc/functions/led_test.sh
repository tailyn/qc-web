#!/bin/bash

#PWR LED
sudo sh -c 'echo 1 > /sys/class/gpio/gpio96/value'
res=$(sudo sh -c 'cat /sys/class/gpio/gpio96/value')

if [[ "$res" == "1" ]]; then
	sleep 0.2
	sudo sh -c 'echo 0 > /sys/class/gpio/gpio96/value'

	#WLAN LED
	sudo sh -c 'echo 0 > /sys/class/gpio/gpio16/value'
	res=$(sudo sh -c 'cat /sys/class/gpio/gpio16/value')

	if [[ "$res" == "0" ]]; then
		sleep 0.2
		sudo sh -c 'echo 1 > /sys/class/gpio/gpio16/value'

		#APP LED
		sudo sh -c 'echo 0 > /sys/class/gpio/gpio17/value'
		res=$(sudo sh -c 'cat /sys/class/gpio/gpio17/value')

		if [[ "$res" == "0" ]]; then
			sleep 0.2
			sudo sh -c 'echo 1 > /sys/class/gpio/gpio17/value'
			echo "Pass"
		else
			sudo sh -c 'echo 1 > /sys/class/gpio/gpio17/value'
			echo "Failed"
		fi
	else
		sudo sh -c 'echo 1 > /sys/class/gpio/gpio16/value'
		echo "Failed"
	fi


else
	sudo sh -c 'echo 0 > /sys/class/gpio/gpio96/value'
	echo "Failed"
fi
