#!/bin/bash -eux

# sudo su
sudo su
sudo sed -e '/PermitRootLogin/ s/^#*/#/' -i /etc/ssh/sshd_config
sudo sed '/^#PermitRootLogin/a PermitRootLogin yes' -i /etc/ssh/sshd_config
sudo sed '/^#ListenAddress 0.0.0.0/s/^#//' -i /etc/ssh/sshd_config
sudo sed '/^#PasswordAuthentication/a PasswordAuthentication yes' -i /etc/ssh/sshd_config
sudo systemctl reload sshd

#echo "root:c0ntrail123" | sudo passwd root
echo "c0ntrail123" | sudo passwd --stdin root
sudo iptables -F 
