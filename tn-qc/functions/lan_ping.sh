# Original Author: Bill

Result_PATH=/root/qc-web/tn-qc/results/Switch_LAN

echo "not_tested" > "$Result_PATH"/lan$1result
while [ true ]
do
    if [ -e /root/qc-web/tn-qc/functions/port$1 ]; then
        ping 192.168.30.25 -c 5 > ping$1.log
        if [[ "$(cat ping$1.log | grep "5 packets received")" ]]; then
            echo "Pass" > "$Result_PATH"/lan$1result
            exit
        else
            if [[ "$(cat ping$1.log | grep "4 packets received")" ]]; then
                echo "Pass" > "$Result_PATH"/lan$1result
                exit
            fi
            echo "Failed" > "$Result_PATH"/lan$1result
        fi
    fi      
    sleep 5          
done
