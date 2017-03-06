#!/bin/sh

# Author: Bill

while [ true ]

do

  ping 10.20.30.1 -c 20 > results/Ethernet/pingwan.log

  if [[ "$(cat results/Ethernet/pingwan.log | grep "20 packets received")" ]]; then
    echo "Pass" > results/Ethernet/result.txt
    exit

  else

    if [[ "$(cat results/Ethernet/pingwan.log | grep "19 packets received")" ]]; then
      echo "Pass" > results/Ethernet/result.txt
      exit

    fi

    echo "Failed" > results/Ethernet/result.txt

  fi

  sleep 5

done
