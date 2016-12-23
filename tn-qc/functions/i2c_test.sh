#!/bin/sh

if [[ "$(i2cdetect -y -r 1)" ]]; then
        echo "Pass"
else
        echo "Failed"
fi
