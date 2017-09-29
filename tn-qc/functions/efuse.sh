#!/bin/sh

mac1=$(cat /sys/fsl_otp/HW_OCOTP_MAC1)
mac0=$(cat /sys/fsl_otp/HW_OCOTP_MAC0)

if [[ "$mac0" == "0x0" ]]; then
        if [[ "$mac1" == "0x0" ]]; then
		echo "Failed" > results/EFUSE/result.txt
        fi
else
	echo "Pass" > results/EFUSE/result.txt
fi
