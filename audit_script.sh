#!/bin/bash
#Sec Script Ver. 9/28/2019

host=$(ip addr | grep 'inet 10' | cut -f 6 -d ' ' | cut -f 1 -d '/')
time=$(date +"%Y.%m.%d-%H:%M")
path='/tmp'
$(mkdir $path/$host)
path="$path/$host"
echo "$host status report: $time" > $path/$time.log
echo -e "\nNetwork Status:\n" >> $path/$time.log
nmcli device status >> $path/$time.log

echo -e "\n\nOpen ports:\n" >> $path/$time.log
ss -lntu | grep LISTEN >> $path/$time.log

echo -e "\n\nFirewalld Status:\n" >> $path/$time.log
systemctl status firewalld >> $path/$time.log

