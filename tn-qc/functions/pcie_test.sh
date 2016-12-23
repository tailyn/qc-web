#!/bin/sh

if [[ "$(lsusb | grep "05c6:9003")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
