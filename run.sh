#!/bin/bash

input=$1

# Safe guard
cat inventory/mycluster_vagrant/hosts.ini >/dev/null || exit 1

case "$input" in
  "status") echo "status:"
    vagrant status
    cat inventory/mycluster_vagrant/hosts.ini

    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2222
    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2200
    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2201
    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2203
    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2204
    ssh -i ~/.vagrant.d/insecure_private_key vagrant@localhost -p 2205
  ;;
  "destroy") echo "destroy:"
    vagrant destroy
  ;;
  "create") echo "create:"
    vagrant up

    ssh-keygen -R '[localhost]:2222'
    ssh-keygen -R '[localhost]:2200'
    ssh-keygen -R '[localhost]:2201'
    ssh-keygen -R '[localhost]:2203'
    ssh-keygen -R '[localhost]:2204'
    ssh-keygen -R '[localhost]:2205'
  ;;
  "playbook") echo "run playbook:"
    ansible-playbook --flush-cache -i inventory/mycluster_vagrant/hosts.ini -v cluster.yml --become
  ;;
  *) echo "Use: status, destroy (VMs), create (VMs), (run) playbook"
  ;;
esac
