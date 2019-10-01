#!/bin/bash
#Sec Script Ver. 9/28/2019

echo "Network Status:"
nmcli device status
echo ""

echo "Open ports:"
cat etc/services
echo ""

echo "Firewalld Status:"
systemctl status firewalld

