#!/bin/bash

# Setup Hostname 
hostnamectl set-hostname "k8s-node1.cloudbinary.io"

# Configure Hostname unto hosts file 
echo "`hostname -I | awk '{ print $1}'` `hostname`" >> /etc/hosts 

# Update the Ubuntu Local Repository with Online Repository 
sudo apt-get update 

# Download, Install & Configure Utility Softwares 
sudo apt-get install git curl unzip tree wget -y 

# Disable swap & add kernel settings
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Load the following kernel modules on all the nodes
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Set the following Kernel parameters for Kubernetes
sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

# Reload the above changes, run
sudo sysctl --system

# Install containerd run time
sudo apt-get install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates 

# Enable docker repository   
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Now, run following apt command to install containerd
sudo apt-get update
sudo apt-get install -y containerd.io

# Configure containerd so that it starts using systemd as cgroup.
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

# Restart and enable containerd service
sudo systemctl restart containerd
sudo systemctl enable containerd

# Add apt repository for Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/kubernetes-jammy.gpg

sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# Install Kubernetes components Kubectl, kubeadm & kubelet
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


### Below steps only For Nodes

# Join Node To K8s Clusterr:

# $ kubeadm join k8s-controller.cloudbinary.io:6443 --token f284ss.yc0g579n0hf43loo --discovery-token-ca-cert-hash sha256:a984431484bd12be3a424242a06b6f1c7322e1b58f1911ab799396279f941cd8 

# STEP-1 :  Create deployment.yml
# File Name : deployment.yml

# STEP-2 : Create Service and Deploy:

# File Name : nginx-service.yaml
# kubectl create service nodeport nginx --tcp=80:80

# kubectl apply -f deployment.yml

# STEP-3 : Update the deployment with new version
# File Name : deployment-update.yaml

# kubectl apply -f deployment-update.yaml

# STEP-4 : Scale the deployment
# File Name : deployment-scale.yaml

# kubectl apply -f  deployment-scale.yaml

# STEP-5 : Deleting a deployment
# kubectl delete deployment nginx-deployment

