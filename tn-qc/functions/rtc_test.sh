#!/bin/bash

if [[ "$(sudo hwclock)" ]]; then
	echo "Pass"
else
	echo "Failed"
fi
