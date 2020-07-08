#!/bin/bash

echo "Starting Provisioning of K8S cluster VM on Azure"

export ANSIBLE_HOST_KEY_CHECKING=False
export AZURE_CLIENT_ID=XXX
export AZURE_SECRET=XXX
export AZURE_SUBSCRIPTION_ID=XXXXX
export AZURE_TENANT=XXXXX


ansible-playbook az_play.yml -vv
if [ "$?" = "0" ]; then

echo " K8S Configuration is starting"
ansible-playbook -i azure_rm.py install_common.yml  --extra-vars 'ansible_user=azureuser ansible_password=Password1234! ansible_sudo_pass=Password1234!' -vv
else
	exit 0
fi

if [ "$?" = "0" ]; then
	echo "Master configuration starting"
	ansible-playbook -i azure_rm.py master.yml  --extra-vars 'ansible_user=azureuser ansible_password=Password1234! ansible_sudo_pass=Password1234!' -vv
else
	exit 0
fi

if [ "$?" = "0" ]; then
	echo "Joining Worker nodes"
	ansible-playbook -i azure_rm.py worker.yml  --extra-vars 'ansible_user=azureuser ansible_password=Password1234! ansible_sudo_pass=Password1234!' -vv
else
	exit 0
fi
echo "Configuration done"

