#!/bin/bash

lan_stat1=$(ifconfig eth0 | grep 'TX packets:' | awk '{print $2}' |  awk -F: '{print $2}')
sleep 5
lan_stat2=$(ifconfig eth0 | grep 'TX packets:' | awk '{print $2}' |  awk -F: '{print $2}')

if [[ "$lan_stat1" == "$lan_stat2" ]]; then
	echo "Failed"
else
	echo "Pass"
fi
