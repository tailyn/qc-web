#!/bin/bash

if [[ "$(lsusb | grep "Quectel")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
