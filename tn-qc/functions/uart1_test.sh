#!/bin/bash

if [[ "$(ls /dev/ttyO0)" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
