#!/bin/sh

while true; do

if [[ "$(i2cdetect -y -r 0 | grep "00" | awk '{print $9}')" == "UU" ]]; then
	aplay /root/qc-web/tn-qc/test-files/audio-test.wav
        echo "Pass" > results/AUDIO/result.txt
else
        echo "Failed" > results/AUDIO/result.txt
fi

done

