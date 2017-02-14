#!/bin/sh

# Original Author: Bill


mac_path=/root/qc-web/tn-qc/results/MACs

while [ true ]
do
    echo "$(ifconfig eth0 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_eth0
    echo "$(ifconfig eth1 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_eth1
    echo "$(ifconfig wlan0 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_wlan0
    echo "$(hciconfig | grep Address | awk '{print $3}')" > "$mac_path"/mac_BT

    if [[ "$(cat "$mac_path"/mac_BT)" == "00:00:00:00:00:00" ]]; then
			> "$mac_path"/mac_BT

done
