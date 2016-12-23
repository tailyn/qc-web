#!/bin/sh

if [[ "$(ifconfig | grep eth0)" ]]; then
        echo "Pass"
else
        echo "Failed"
fi
