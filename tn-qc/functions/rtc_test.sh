#!/bin/sh

if [[ "$(hwclock)" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
