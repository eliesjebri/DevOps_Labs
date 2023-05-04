#!/usr/bin/env bash

# THIS SCRIPT WILL CREATE SSH KEYPAIR AND DISTRIBUTE ACROSS ALL NODES

ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

# LOOPING THROUGH AND DISTRIBUTING THE KEY

for val in master01 host01 host02 host03; do 
	echo "-------------------- COPYING KEY TO ${val^^} NODE ------------------------------"
	sshpass -p 'vagrant' ssh-copy-id -o "StrictHostKeyChecking=no" vagrant@$val 
done

# CREATE THE INVENTORY FILE

PROJECT_DIRECTORY="/home/vagrant/ansible_project/"

mkdir -p $PROJECT_DIRECTORY
cd $PROJECT_DIRECTORY

# Creating the inventory file for all 4 nodes to run some adhoc command.

echo -e "master01\n\n[centos]\nhost01\n\n[centos7]\nhost02\nhost03" > inventory
echo -e "[defaults]\ninventory = inventory" > ansible.cfg
echo -e "-------------------- RUNNING ANSBILE ADHOC COMMAND - UPTIME ------------------------------"
echo

# running adhoc command to see if everything is fine

ansible all -i inventory -m "shell" -a "uptime"
echo