#!/bin/sh

if [[ "$(hwclock)" ]]; then
	echo "Pass" > results/RTC/result.txt
else
	echo "Failed" > results/RTC/result.txt
fi

