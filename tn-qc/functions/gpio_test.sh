#!/bin/bash

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio488/direction')" != "in" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio489/direction')" != "in" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio490/direction')" != "in" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio491/direction')" != "in" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio492/direction')" != "out" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio493/direction')" != "out" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio494/direction')" != "out" ]]; then
	echo "Failed"
	exit
fi

if [[ "$(sudo sh -c 'cat /sys/class/gpio/gpio495/direction')" != "out" ]]; then
	echo "Failed"
	exit
else
	echo "Pass"
fi
