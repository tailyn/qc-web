#!/bin/bash

IMAGE=/root/qc-web/tn-image/android.xz
xzcat $IMAGE | dd of=/dev/mmcblk0 bs=1048576;sync;
echo wq | fdisk /dev/mmcblk0
echo "Pass" > results/eMMC/result.txt
