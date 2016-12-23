#!/bin/sh

#PWR LED
 sh -c 'echo 1 > /sys/class/gpio/gpio96/value'
res=$( sh -c 'cat /sys/class/gpio/gpio96/value')

if [[ "$res" == "1" ]]; then
	sleep 0.2
	 sh -c 'echo 0 > /sys/class/gpio/gpio96/value'

	#WLAN LED
	 sh -c 'echo 0 > /sys/class/gpio/gpio16/value'
	res=$( sh -c 'cat /sys/class/gpio/gpio16/value')

	if [[ "$res" == "0" ]]; then
		sleep 0.2
		 sh -c 'echo 1 > /sys/class/gpio/gpio16/value'

		#APP LED
		 sh -c 'echo 0 > /sys/class/gpio/gpio17/value'
		res=$( sh -c 'cat /sys/class/gpio/gpio17/value')

		if [[ "$res" == "0" ]]; then
			sleep 0.2
			 sh -c 'echo 1 > /sys/class/gpio/gpio17/value'
			echo "Pass"
		else
			 sh -c 'echo 1 > /sys/class/gpio/gpio17/value'
			echo "Failed"
		fi
	else
		 sh -c 'echo 1 > /sys/class/gpio/gpio16/value'
		echo "Failed"
	fi


else
	 sh -c 'echo 0 > /sys/class/gpio/gpio96/value'
	echo "Failed"
fi
