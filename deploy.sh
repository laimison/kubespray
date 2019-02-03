#!/bin/bash

ansible-playbook --flush-cache -i inventory/mycluster_vagrant/hosts.ini --become -v cluster.yml
