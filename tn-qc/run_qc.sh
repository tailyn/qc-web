#!/bin/sh

# Author: Wig
# Only for ARM base platform

CONFIG=bf8a1.conf

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
	if [[ $line == "eMMC" ]]; then
		./functions/emmc_test.sh &
	fi
	if [[ $line == "I2C" ]]; then
		./functions/i2c_test.sh &
	fi
	if [[ $line == "UART1" ]]; then
		./functions/uart1_test.sh &
	fi
        if [[ $line == "UART23" ]]; then 
                ./functions/uart23_test.sh &
        fi 
        if [[ $line == "UART4" ]]; then     
        	./functions/uart4_test.sh &
	fi 
	if [[ $line == "RTC" ]]; then
		./functions/rtc_test.sh &
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

	if [[ $line == "GPIO" ]]; then
		./functions/gpio_test.sh &	
	fi

	if [[ $line == "eFUSE" ]]; then
		./functions/efuse_test.sh &
	fi

        if [[ $line == "VGA" ]]; then     
		./functions/vga_test.sh &
        fi

        if [[ $line == "SATA" ]]; then     
                ./functions/sata_test.sh & 
        fi

        if [[ $line == "TOUCH" ]]; then 
                ./functions/touch_test.sh &     
        fi
	if [[ $line == "AUDIO" ]]; then     
                ./functions/audio_test.sh &
        fi

	sleep 0.3
done
