#!/bin/bash

#NB: you may prefer to go to https://manage.windowsazure.com, Cloud Services, Dashboard and START
#  the VMs will be started in parallel

# the following settings may be different for you:
vmservice="mdoa34b"
vmprefix="mdoa34-"

vmnumber=0

while [ $vmnumber -lt 8 ]
do
	vmname=$vmprefix$vmnumber
	vmipaddress=10.0.0.$((100+$vmnumber))

	echo "vm $vmname at $vmipaddress"
	azure vm start --dns-name $vmservice $vmname
	
	vmnumber=$((vmnumber+1))
done
