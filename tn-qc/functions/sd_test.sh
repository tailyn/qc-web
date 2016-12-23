#!/bin/sh


if [[ "$(dmesg | grep mmcblk0)" ]]; then
        echo "Pass"
else
        echo "Failed"
fi
