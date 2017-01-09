#!/bin/sh

logfile=results/Nand_flash/flashnand.log

echo "flash start..........." > $logfile
./functions/led_check start &
flash_erase /dev/mtd0 0 0 >> $logfile
flash_erase /dev/mtd1 0 0 >> $logfile
flash_erase /dev/mtd2 0 0 >> $logfile
flash_erase /dev/mtd3 0 0 >> $logfile
flash_erase /dev/mtd4 0 0 >> $logfile
flash_erase /dev/mtd5 0 0 >> $logfile
flash_erase /dev/mtd6 0 0 >> $logfile
flash_erase /dev/mtd7 0 0 >> $logfile
flash_erase /dev/mtd8 0 0 >> $logfile
flash_erase /dev/mtd9 0 0 >> $logfile
sync
nandwrite -p /dev/mtd0 MLO >> $logfile
nandwrite -p /dev/mtd1 MLO >> $logfile
nandwrite -p /dev/mtd2 MLO >> $logfile
nandwrite -p /dev/mtd3 MLO >> $logfile
nandwrite -p /dev/mtd4 am335x-st7b2.dtb >> $logfile
nandwrite -p /dev/mtd5 u-boot.img >> $logfile
nandwrite -p /dev/mtd6 uEnv.txt >> $logfile
nandwrite -p /dev/mtd7 uEnv.txt >> $logfile
nandwrite -p /dev/mtd8 zImage >> $logfile
nandwrite -p /dev/mtd9 ubi.img >> $logfile
sync
./functions/led_check
echo "flash done." >> $logfile
diff -B -b -i $logfile results/Nand_flash/pass.log > results/Nand_flash/diffresult
if [[ "$(cat results/Nand_flash/diffresult | grep "flashnand")" ]]; then
    echo "Failed" > results/Nand_flash/reselt.txt
else
    echo "Pass" > results/Nand_flash/reselt.txt
fi
