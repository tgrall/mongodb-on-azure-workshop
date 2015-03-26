#!/bin/bash
#this script is inspired from http://haishibai.blogspot.fr/2014/12/mongodb-clusters-on-azure-using-mms-and.html
curl -OL https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_1.7.0.992-1_amd64.deb
sudo dpkg -i mongodb-mms-automation-agent-manager_1.7.0.992-1_amd64.deb
sudo sed -i 's/mmsGroupId=@GROUP_ID@/mmsGroupId=__XYZ__/g' /etc/mongodb-mms/automation-agent.config
sudo sed -i 's/mmsApiKey=@API_KEY@/mmsApiKey=__XYZ__/g' /etc/mongodb-mms/automation-agent.config

sudo sfdisk /dev/sdc < ~/dev_sdc_config
sudo mkfs -t ext4 /dev/sdc1
sudo mkdir -p /data
sudo mount /dev/sdc1 /data
sudo sed -i '$a/dev/sdc1 /data ext4 defaults 1 2' /etc/fstab

sudo chown mongodb:mongodb /data
sudo start mongodb-mms-automation-agent
