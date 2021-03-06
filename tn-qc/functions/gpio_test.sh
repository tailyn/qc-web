#!/bin/sh

echo 1 > /sys/class/gpio/gpio492/value
echo 1 > /sys/class/gpio/gpio493/value
echo 1 > /sys/class/gpio/gpio494/value
echo 1 > /sys/class/gpio/gpio495/value

while true; do

if [[ "$( sh -c 'cat /sys/class/gpio/gpio488/direction')" != "in" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio488/value')" != "1" ]]; then
        echo "Failed" > results/GPIO/result.txt
        exit

fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio489/direction')" != "in" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio489/value')" != "1" ]]; then
        echo "Failed" > results/GPIO/result.txt
        exit

fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio490/direction')" != "in" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio490/value')" != "1" ]]; then
        echo "Failed" > results/GPIO/result.txt
        exit

fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio491/direction')" != "in" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio491/value')" != "1" ]]; then
        echo "Failed" > results/GPIO/result.txt
        exit

fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio492/direction')" != "out" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio493/direction')" != "out" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio494/direction')" != "out" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
fi

if [[ "$( sh -c 'cat /sys/class/gpio/gpio495/direction')" != "out" ]]; then
	echo "Failed" > results/GPIO/result.txt
	exit
else
	echo "Pass" > results/GPIO/result.txt
fi

sleep 2
done
