#!/bin/sh

# Author: Bill

while [ true ]

do

  ping 10.20.30.1 -c 20 > results/Ethernet/pingwan.log

  if [[ "$(cat results/Ethernet/pingwan.log | grep "20 packets received")" ]]; then
    ethtool -s eth1 speed 100 duplex full
    sleep 1
	ping 10.20.30.1 -c 20 > results/Ethernet/pingwan.log
        if [[ "$(cat results/Ethernet/pingwan.log | grep "20 packets received")" ]]; then
		echo "Pass" > results/Ethernet/result.txt
		exit
	else
		echo "Failed" > results/Ethernet/result.txt
	fi

  else

    echo "Failed" > results/Ethernet/result.txt

  fi

  sleep 2

done
