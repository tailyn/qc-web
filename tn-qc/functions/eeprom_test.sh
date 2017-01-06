#!/bin/sh

if [[ "$(dmesg | grep at24)" ]]; then
  echo "Pass" > results/EEPROM/result.txt
else
  echo "Failed" > results/EEPROM/result.txt
fi
