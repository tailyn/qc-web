#!/bin/sh

while true; do

if [[ "$(cat /proc/cpuinfo)" ]]; then
	cpu_usage=$(top -bn1 | grep "CPU:" | awk '{print $2}' | head -1)
	echo "Pass" > results/CPU/result.txt
	echo $cpu_usage > results/CPU/usage.txt

else
	echo "Failed"> results/CPU/result.txt
fi

sleep 2
done
