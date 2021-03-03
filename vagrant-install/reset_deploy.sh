#!/bin/bash -eux

ansible-playbook -i hosts resetk8s.yml
sleep 60
vagrant up

# delete inventory host file
run -rf 
