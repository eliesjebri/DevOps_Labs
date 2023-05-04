#!/usr/bin/env bash

# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Supressing the banner message everytime you connect to the vagrant box.

touch /home/vagrant/.hushlogin

# Updating the hosts file for all the 3 nodes with the IP given in vagrantfile

# 10.20.30.10 master01.anslab.com master01
# 10.20.30.11 host01.anslab.com host01
# 10.20.30.12 host02.anslab.com host02
# 10.20.30.13 host03.anslab.com host03

echo -e "10.20.30.10 master01.anslab.com master01\n10.20.30.11 host01.anslab.com host01\n10.20.30.12 host02.anslab.com host02\n10.20.30.13 host03.anslab.com host03" >> /etc/hosts

# Installing necessary packages 

sudo yum -y install curl wget python3 sshpass epel-release


# Install ansible using pip only in master01.anslab.com node
if [[ $(hostname) = "master01.anslab.com" ]]; then
  sudo yum -y install ansible
fi


