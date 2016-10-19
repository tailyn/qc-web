#!/bin/bash

TEST_SIZE=100

stressapptest -s 5 -M $TEST_SIZE -m 4 -W > mem_stat

if [[ "$(cat mem_stat | grep "PASS")" ]]; then
	echo "Pass"
else
	echo "Failed"
fi

rm mem_stat
