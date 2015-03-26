#!/bin/bash

# the following settings may be different for you:
vmprefix="mdoa34-" # $vmservice.cloudapp.net

vmnumber=0

while [ $vmnumber -lt 8 ]
do
	vmname=$vmprefix$vmnumber
	vmipaddress=10.0.0.$((100+$vmnumber))

	echo "vm $vmname at $vmipaddress"
	
	#ssh -t -i mdoa mdoa@$vmipaddress 'sudo mkdir -p /usr/lib/jvm'
	
	scp -i mdoa mdoa-config-automation.sh mdoa@$vmipaddress:/home/mdoa/mdoa-config-automation.sh
	scp -i mdoa dev_sdc_config mdoa@$vmipaddress:/home/mdoa/dev_sdc_config
	ssh -t -i mdoa  mdoa@$vmipaddress './mdoa-config-automation.sh'

	vmnumber=$((vmnumber+1))
done
