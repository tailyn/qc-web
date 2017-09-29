#!/bin/sh

while true; do

cat /dev/ttymxc0 > /root/qc-web/tn-qc/results/UART1/uart1_stat &
sleep 0.5
echo "123" > /dev/ttymxc0
sleep 0.5

uart_res=$(head -1 /root/qc-web/tn-qc/results/UART1/uart1_stat)
if [[ "$uart_res" == "123" ]]; then
	echo "Pass" > /root/qc-web/tn-qc/results/UART1/result.txt
else
	echo "Failed" > /root/qc-web/tn-qc/results/UART1/result.txt
fi

rm /root/qc-web/tn-qc/results/UART1/uart1_stat
ps_id=$(ps aux | grep "ttymxc0" | head -1 | awk '{print $2}')
kill -9 $ps_id

sleep 20
done
