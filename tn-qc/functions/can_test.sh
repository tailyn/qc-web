#!/bin/bash

if [[ "$(ifconfig | grep "can0")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi