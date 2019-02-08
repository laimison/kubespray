### Original Documentation

[README_original.md](README_original.md)

### Usage

Run the script to get info how to create Vagrant VMs and run this playbook

```
./run.sh
```

### Test the cluster

```
alias k='kubectl'
k create deployment --image nginx my-nginx
k scale deployment --replicas 2 my-nginx
k get pods -o wide
k get deployment
k expose deployment my-nginx --port=80 --type=NodePort
k get services -o wide

curl http://cluster-ip
```
