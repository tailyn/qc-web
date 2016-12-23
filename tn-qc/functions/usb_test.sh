#!/bin/sh

if [[ "$(dmesg | grep "Mass Storage")" ]]; then
	if [[ "$(cat /proc/partitions | grep "sd")" ]]; then
        	echo "Pass"
	else
        	echo "Failed"
	fi
else
	echo "Failed"
fi
