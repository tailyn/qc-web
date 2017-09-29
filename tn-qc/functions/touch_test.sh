#!/bin/sh

if [[ "$(i2cdetect -y -r 1 | grep "40:" | awk '{print $15}')" == "UU" ]]; then

	export TSLIB_FBDEVICE=/dev/fb2 
	export TSLIB_CONSOLEDEVICE=none       
	export TSLIB_CALIBFILE=/etc/pointercal
	export TSLIB_CONFFILE=/etc/ts.conf    
	#ts_calibrate                                       
	sleep 1                                             
	ts_test                                             
	echo "Pass" > results/TOUCH/result.txt
else
        echo "Failed" > results/TOUCH/result.txt
fi

mplayer -nosound -vo fbdev:/dev/fb2 /root/qc-web/tn-qc/test-files/video-test.mp4

fb-test -f 2                                               
sleep 5                                                    
fb-test -f 2 -r                                            
sleep 1                                                    
fb-test -f 2 -g                     
sleep 1                                                    
fb-test -f 2 -b                                            
sleep 2            
fb-test -f 2
echo "Pass" > results/LVDS/result.txt

sleep 1

for i in `seq 0 7`;                               
do                                                
        echo $i > /sys/class/backlight/backlight/brightness
	sleep 1
done
echo "Pass" > results/PWM/result.txt
