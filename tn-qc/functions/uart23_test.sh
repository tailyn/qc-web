#!/bin/bash

sudo sh -c 'cat /dev/ttyO2 > uart23_stat &'
echo "123" > /dev/ttyO1

uart_res=$(head -1 uart23_stat)

if [[ "$uart_res" == "123" ]]; then
	echo "Pass"
else
	echo "Failed"
fi

rm uart23_stat

ps aux | grep "ttyO2" | awk '{print $2}' > uart23_stat
ps_filter=$(head -1 uart23_stat)
sudo kill -9 $ps_filter
rm uart23_stat
