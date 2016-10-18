#!/bin/bash

ping www.google.com -c 8 > ping_stat
stat=$(cat ping_stat | grep "packet loss" | awk '{print $6}')

if [[ "$stat" == "0%" ]]; then
        echo "Pass"
else
        echo "Failed"
fi

rm ping_stat
