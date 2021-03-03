#!/bin/bash -eux

vagrant up
sleep 60
ansible-playbook -i hosts deployk8s.yml
