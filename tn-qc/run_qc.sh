#!/bin/sh

# Author: Wig
# Only for ARM base platform

CONFIG=st7b2.conf


cat $CONFIG | while read line; do
	if [[ $line == "CPU" ]]; then
		./functions/cpu_test.sh &
	fi

	if [[ $line == "Memory" ]]; then
		./functions/mem_test.sh &
	fi
	if [[ $line == "SD" ]]; then
		./functions/sd_test.sh &
	fi
	if [[ $line == "Nand_flash" ]]; then
		./functions/nand_test.sh &
	fi
	if [[ $line == "I2C1" ]]; then
		./functions/i2c_test.sh &
	fi
	if [[ $line == "UART" ]]; then
		./functions/uart23_test.sh &
	fi
	if [[ $line == "RTC" ]]; then
		./functions/rtc_test.sh &
	fi
	if [[ $line == "Switch_LAN" ]]; then
	  ./functions/lan_ping.sh 1 25 &
	  ./functions/lan_ping.sh 2 26 &
	  ./functions/lan_ping.sh 3 27 &
	  ./functions/lan_ping.sh 4 28 &
    ./functions/lan_test.sh &
	fi
	if [[ $line == "USB" ]]; then
		./functions/usb_test.sh &
	fi
	if [[ $line == "Ethernet" ]]; then
		./functions/eth_test.sh &
	fi

	if [[ $line == "Wifi" ]]; then
		./functions/wifi_test.sh &
	fi
	if [[ $line == "Bluetooth" ]]; then
		./functions/bt_test.sh &
	fi
	if [[ $line == "mPCIE" ]]; then
		./functions/pcie_test.sh &
	fi
	if [[ $line == "SIM_card" ]]; then
		./functions/sim_test.sh &
	fi
	if [[ $line == "CAN_bus" ]]; then
		./functions/can_test.sh &
	fi

	if [[ $line == "LED" ]]; then
		./functions/led_test.sh &
	fi

	if [[ $line == "GPIO" ]]; then
		./functions/gpio_test.sh &
	fi
	sleep 0.3
done
