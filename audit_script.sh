#!/bin/bash
#Sec Script Ver. 9/28/2019

echo "Network Status:"
nmcli device status
echo ""

echo "Open ports:"
sudo lsof -i -P -n | grep LISTEN
echo ""

echo "Firewalld Status:"
systemctl status firewalld

