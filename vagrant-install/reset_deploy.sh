#!/bin/bash -eux

# run reset playbook
ansible-playbook -i hosts resetk8s.yml
sleep 60

# delete inventory host file
rm hosts
