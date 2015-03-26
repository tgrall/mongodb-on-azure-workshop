#!/bin/bash

#NB: you may prefer to go to https://manage.windowsazure.com, Cloud Services, Dashboard and STOP
#  the VMs will be stopped in parallel

vmprefix="mdoa34-"

# the following settings may be different for you:
vmservice="mdoa34b"

vmnumber=0

while [ $vmnumber -lt 8 ]
do
	vmname=$vmprefix$vmnumber
	vmipaddress=10.0.0.$((100+$vmnumber))

	echo "vm $vmname at $vmipaddress"
	azure vm shutdown --dns-name $vmservice $vmname
	
	vmnumber=$((vmnumber+1))
done
