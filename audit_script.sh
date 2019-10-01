#!/bin/bash
#Sec Script Ver. 9/28/2019

$host = $(ip addr | grep 'inet 10' | cut -f 1 -d ' ')
$time = $(date +"%Y%m%d%H%M")
echo "$host status report: $time" > /tmp/$host-$time.log
echo -e "\nNetwork Status:\n" >> /tmp/$host-$time.log
nmcli device status >> /tmp/$host-$time.log

echo -e "\n\nOpen ports:\n" >> /tmp/$host-$time.log
ss -lntu | grep LISTEN >> /tmp/$host-$time.log

echo -e "\n\nFirewalld Status:\n" >> /tmp/$host-$time.log
systemctl status firewalld >> /tmp/$host-$time.log

