#!/bin/sh

while true; do

cat /dev/ttymxc1 > /root/qc-web/tn-qc/results/UART23/uart23_stat &
sleep 0.5
echo "123" > /dev/ttymxc2
sleep 0.5

uart_res=$(head -1 /root/qc-web/tn-qc/results/UART23/uart23_stat)
sleep 0.5

if [[ "$uart_res" == "123" ]]; then
	echo "Pass" > /root/qc-web/tn-qc/results/UART23/result.txt
else
	echo "Failed" > /root/qc-web/tn-qc/results/UART23/result.txt
fi

rm /root/qc-web/tn-qc/results/UART23/uart23_stat
ps_id=$(ps aux | grep "ttymxc1" | head -1 | awk '{print $2}')
kill -9 $ps_id

sleep 10
done
