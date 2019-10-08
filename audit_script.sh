#!/bin/bash
#Sec Script Ver. 9/28/2019

host=$(ip addr | grep 'inet 10' | cut -f 6 -d ' ' | cut -f 1 -d '/')
time=$(date +"%Y.%m.%d-%H:%M")
path='/tmp/audit'
echo "$host status report: $time" > $path/$host-$time.log
echo -e "\nNetwork Status:\n" >> $path/$host-$time.log
nmcli device status >> $path/$host-$time.log

echo -e "\n\nOpen ports:\n" >> $path/$host-$time.log
ss -lntu | grep LISTEN >> $path/$host-$time.log

echo -e "\n\nFirewalld Status:\n" >> $path/$host-$time.log
systemctl status firewalld >> $path/$host-$time.log

