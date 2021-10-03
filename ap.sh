#!/bin/bash

#sudo create_ap wl01 enp2s0 JimmyCheng password

if [ "$1" = "on" ]
then
	echo "START AP JimmyCheng"
	sudo systemctl start create_ap
elif [ "$1" = "stop" ]
then
	echo "STOP AP JimmyCheng"
	sudo systemctl stop create_ap
elif [ "$1" = "s" ]
then
	echo "Status AP JimmyCheng"
	sudo systemctl status create_ap
fi
