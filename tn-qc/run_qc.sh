#!/bin/bash

# Author: Wig
# Only for ARM base platform

CONFIG=st7b2.conf

cat $CONFIG | while read line; do
	if [[ $line == "CPU" ]]; then
		./functions/cpu_test.sh
	fi

	if [[ $line == "Memory" ]]; then
		./functions/mem_test.sh
	fi
	if [[ $line == "SD" ]]; then
		./functions/sd_test.sh
	fi
	if [[ $line == "Nand flash" ]]; then
		./functions/nand_test.sh
	fi
	if [[ $line == "I2C1" ]]; then
		./functions/i2c_test.sh
	fi
	if [[ $line == "UART1" ]]; then
		./functions/uart1_test.sh
	fi
	if [[ $line == "UART2" ]]; then
		./functions/uart23_test.sh
	fi
	if [[ $line == "UART3" ]]; then
		./functions/uart23_test.sh
	fi
	if [[ $line == "RTC" ]]; then
		./functions/rtc_test.sh
	fi
	if [[ $line == "Switch LAN" ]]; then
		./functions/lan_test.sh
	fi
	if [[ $line == "USB" ]]; then
		./functions/usb_test.sh
	fi
	if [[ $line == "Ethernet" ]]; then
		./functions/eth_test.sh
	fi

	if [[ $line == "Wifi" ]]; then
		./functions/wifi_test.sh
	fi
	if [[ $line == "Bluetooth" ]]; then
		echo "Failed"
	fi
	if [[ $line == "mPCIE" ]]; then
		./functions/pcie_test.sh
	fi
	if [[ $line == "CAN bus" ]]; then
		./functions/can_test.sh
	fi

	if [[ $line == "LED" ]]; then
		./functions/led_test.sh
	fi

	if [[ $line == "GPIO" ]]; then
		./functions/gpio_test.sh
	fi
done
