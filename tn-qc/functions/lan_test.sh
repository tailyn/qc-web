#!/bin/sh

if [[ "$(dmesg | grep "IP175C")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
