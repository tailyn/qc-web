#!/bin/bash


if [[ "$(dmesg | grep mmcblk0 | grep SD)" ]]; then
        echo "Pass"
else
        echo "Failed"
fi
