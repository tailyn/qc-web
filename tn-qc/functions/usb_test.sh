#!/bin/sh

while true; do

if [[ "$(dmesg | grep "Mass Storage")" ]]; then
	if [[ "$(cat /proc/partitions | grep "sda")" ]]; then
		if [[ "$(cat /proc/partitions | grep "sdb")" ]]; then
			if [[ "$(cat /proc/partitions | grep "sdc")" ]]; then
				if [[ "$(cat /proc/partitions | grep "sdd")" ]]; then
          				echo "Pass" > results/USB/result.txt
				else
					echo "Failed" > results/USB/result.txt
				fi
			else
				echo "Failed" > results/USB/result.txt
			fi

		else
			echo "Failed" > results/USB/result.txt
		fi
	else
        	echo "Failed" > results/USB/result.txt
	fi
else
	echo "Failed" > results/USB/result.txt
fi

sleep 2
done
