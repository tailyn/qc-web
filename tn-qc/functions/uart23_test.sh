#!/bin/sh

while true; do

cat /dev/ttyO2 > uart23_stat &
sleep 0.1
echo "123" > /dev/ttyO1

uart_res=$(head -1 uart23_stat)

if [[ "$uart_res" == "123" ]]; then
	echo "Pass" > /root/qc-web/tn-qc/results/UART/result.txt
else
	echo "Failed" > /root/qc-web/tn-qc/results/UART/result.txt
fi

rm uart23_stat

ps aux | grep "ttyO2" | awk '{print $1}' > uart23_stat
ps_filter=$(head -1 uart23_stat)
kill -9 $ps_filter
rm uart23_stat

sync
sleep 2
done
