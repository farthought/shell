#!/bin/bash 

IPCONFIG_PATH=/etc/network/
IPCONFIG_FILE=interfaces
IPCONFIG_FILE_BAK=interfaces.bak

if [ ! -f "$IPCONFIG_PATH/$IPCONFIG_FILE_BAK" ];then
	mv $IPCONFIG_PATH/$IPCONFIG_FILE $IPCONFIG_PATH/$IPCONFIG_FILE_BAK
fi
cat $IPCONFIG_PATH/$IPCONFIG_FILE_BAK >$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "auto eth0" >>$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "iface eth0 inet static" >>$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "address 192.168.37.201" >>$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "gateway 192.168.37.1" >>$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "netmask 255.255.255.0" >>$IPCONFIG_PATH/$IPCONFIG_FILE
echo -e "broadcast 192.168.37.255" >>$IPCONFIG_PATH/$IPCONFIG_FILE

ifdown --force eth0
ifup --force eth0

if [ $? -eq 0 ];then
	echo -e "Config static ip ok\n"
	ifconfig eth0
else
	echo -e "Config Failed!\nPlease try again"
fi
