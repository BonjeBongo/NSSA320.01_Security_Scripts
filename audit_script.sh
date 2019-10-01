#!/bin/bash
#Sec Script Ver. 9/28/2019

$host = $(ip addr | grep 'inet 10' | cut -f 1 -d ' ')
$time = $(date +"%Y%m%d%H%M")
echo "$host status report: $time" > /tmp/$time.log
echo -e "\nNetwork Status:\n" >> /tmp/$time.log
nmcli device status >> /tmp/$time.log

echo -e "\n\nOpen ports:\n" >> /tmp/$time.log
ss -lntu | grep LISTEN >> /tmp/$time.log

echo -e "\n\nFirewalld Status:\n" >> /tmp/$time.log
systemctl status firewalld >> /tmp/$time.log

