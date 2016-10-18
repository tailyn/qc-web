#!/bin/bash

if [[ "$(sudo iw dev wlan0 scan | grep "TAILYN-MIS")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
