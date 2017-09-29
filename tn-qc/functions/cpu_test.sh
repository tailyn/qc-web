#!/bin/sh

while true; do

if [[ "$(cat /proc/cpuinfo)" ]]; then
	cpu_usage=$(mpstat | grep -A 5 "%idle" | tail -n 1 | awk -F " " '{print 100 -  $ 12}')
	cpu_temp=$((`cat /sys/class/thermal/thermal_zone0/temp`/1000))
	echo "Pass" > results/CPU/result.txt
	echo $cpu_usage > results/CPU/usage.txt
 	echo $cpu_temp > results/CPU/temp.txt
	
	if [ $cpu_temp -lt 85 ]; then
    		echo "Pass" > results/TEMP/result.txt
	else
    		echo "Failed" > results/TEMP/result.txt
	fi
else
	echo "Failed"> results/CPU/result.txt
	echo "Failed" > results/TEMP/result.txt
fi

sleep 2
done
