#!/bin/bash
export CHECKFORM=$(echo $CHECKFORM | sed -e 's/::/\&/g')

if [ ! -f "/root/provisioned" ]; then
echo "Setup Installation Framework" > status.txt
apt-add-repository --yes --update ppa:ansible/ansible
apt --yes install ansible

ansible-galaxy install Datadog.datadog

echo "Installing Services"> status.txt
ansible-playbook /root/ansible/dd101.yaml
echo "done" > status.txt
fi