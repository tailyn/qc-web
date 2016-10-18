#!/bin/bash

if [[ "$(sudo flash_erase /dev/mtd0 0 0 )" ]]; then
	sudo flash_erase /dev/mtd1 0 0 > /dev/null
	sudo flash_erase /dev/mtd2 0 0 > /dev/null
	sudo flash_erase /dev/mtd3 0 0 > /dev/null
	sudo flash_erase /dev/mtd4 0 0 > /dev/null
	sudo flash_erase /dev/mtd5 0 0 > /dev/null
	sudo flash_erase /dev/mtd6 0 0 > /dev/null
	sudo flash_erase /dev/mtd7 0 0 > /dev/null
	sudo flash_erase /dev/mtd8 0 0 > /dev/null
	sudo flash_erase /dev/mtd9 0 0 > /dev/null
	echo "Pass"
else
	echo "Failed"
fi