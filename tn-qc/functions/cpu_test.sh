#!/bin/sh

if [[ "$(cat /proc/cpuinfo)" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
