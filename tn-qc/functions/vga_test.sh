#!/bin/sh

while true; do

if [[ "$(i2cdetect -y -r 2 | grep '50: 50')" ]]; then
        echo "Pass" > results/VGA/result.txt
else
        echo "Failed" > results/VGA/result.txt
fi

fb-test
sleep 5
fb-test -r 
sleep 1
fb-test -g
sleep 1
fb-test -b
sleep 2
done

