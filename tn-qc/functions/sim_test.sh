#!/bin/sh

SIM_PATH=/root/qc-web/tn-qc/results/SIM_card

while true; do

echo '05c6 9003' > /sys/bus/usb-serial/drivers/generic/new_id
sleep 0.5
cat /dev/ttyUSB3 > $SIM_PATH/sim_status &
echo -e "at+qccid \r\n" > /dev/ttyUSB3
sleep 0.5
if [[ "$(grep -rn "QCCID:" $SIM_PATH/sim_status)" ]]; then

  sim_ps=$(ps | grep "ttyUSB3" | head -1 | awk '{print $1}')
  kill $sim_ps
	echo "Pass" > $SIM_PATH/result.txt
  rm $SIM_PATH/sim_status
  exit
else
  sim_ps=$(ps | grep "ttyUSB3" | head -1 | awk '{print $1}')
  kill $sim_ps
  rm $SIM_PATH/sim_status
	echo "Failed" > $SIM_PATH/result.txt
fi

sleep 2
done
