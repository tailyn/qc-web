#!/bin/sh
# Original Author: Bill

Result_PATH=/root/qc-web/tn-qc/results/Switch_LAN

echo "not_tested" > "$Result_PATH"/lan$1result

while [ true ]
do
  ping 192.168.30.$2 -c 5 > ping$1.log
  if [[ "$(cat "$Result_PATH"/ping$1.log | grep "5 packets received")" ]]; then
    echo "Pass" > "$Result_PATH"/lan$1result
    exit
  else
    if [[ "$(cat "$Result_PATH"/ping$1.log | grep "4 packets received")" ]]; then
      echo "Pass" > "$Result_PATH"/lan$1result
      exit
    fi
    echo "Failed" > "$Result_PATH"/lan$1result
  fi
sleep 2
done
