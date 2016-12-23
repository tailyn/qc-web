#!/bin/sh

if [[ "$(free -m)" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
