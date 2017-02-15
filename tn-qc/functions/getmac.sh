#!/bin/sh

# Original Author: Bill


mac_path=/root/qc-web/tn-qc/results/MACs

while [ true ]
do
    echo "$(ifconfig eth0 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_eth0
    if [[ "$(cat "$mac_path"/mac_eth0)" == "00:00:00:00:00:00" ]]; then
			> "$mac_path"/mac_eth0
    fi

    echo "$(ifconfig eth1 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_eth1
    if [[ "$(cat "$mac_path"/mac_eth1)" == "00:00:00:00:00:00" ]]; then
			> "$mac_path"/mac_eth1
    fi
    echo "$(ifconfig wlan0 | grep HWaddr | awk '{print $5}')" > "$mac_path"/mac_wlan0
    if [[ "$(cat "$mac_path"/mac_wlan0)" == "00:00:00:00:00:00" ]]; then
			> "$mac_path"/mac_wlan0
    fi

    echo "$(hciconfig | grep Address | awk '{print $3}')" > "$mac_path"/mac_BT

    if [[ "$(cat "$mac_path"/mac_BT)" == "00:00:00:00:00:00" ]]; then
			> "$mac_path"/mac_BT
    fi

    sleep 3
done
