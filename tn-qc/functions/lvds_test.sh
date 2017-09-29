#!/bin/sh

fb-test -f 2 
sleep 5
fb-test -f 2 -r
sleep 1
fb-test -f 2 -g
sleep 1
fb-test -f 2 -b
sleep 2
fb-test -f 2
