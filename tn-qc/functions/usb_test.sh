#!/bin/bash

if [[ "$(dmesg | grep "Mass Storage")" ]]; then
	if [[ "$(lsblk | grep "sd")" ]]; then
        	echo "Pass"
	else
        	echo "Failed"
	fi
fi
