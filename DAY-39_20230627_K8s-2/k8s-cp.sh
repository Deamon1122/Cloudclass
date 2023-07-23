#!/bin/bash

# Setup Hostname 
hostnamectl set-hostname "k8s-cp.cloudbinary.io"

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
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/kubernetes-jammy.gpg
#sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-jammy main"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/kubernetes-xenial.gpg
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# Install Kubernetes components Kubectl, kubeadm & kubelet
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

### Below steps only For Control Plane

# Initialize Kubernetes cluster with Kubeadm command

# Run the following Kubeadm command from the master node only.
sudo kubeadm init --control-plane-endpoint=k8s-cp.cloudbinary.io

# To start using your cluster, you need to run the following as a regular user:

# $ mkdir -p $HOME/.kube

# $ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# $ sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Alternatively, if you are the root user, you can run: 

# $ export KUBECONFIG=/etc/kubernetes/admin.conf

# Now, try to run following kubectl commands to view cluster and node status
# $ kubectl cluster-info

# Check the nodes status from master node using kubectl command,
# $ kubectl get nodes

# Join both the worker nodes to the cluster, command is already there is output, just copy paste on the worker nodes,

# kubeadm join k8s-cp.cloudbinary.io:6443 --token gfj44y.ib0q2wugpx6czwbl --discovery-token-ca-cert-hash sha256:a984431484bd12be3a424242a06b6f1c7322e1b58f1911ab799396279f941cd8 

# Check the nodes status from master node using kubectl command,
# $ kubectl get nodes

# As we can see nodes status is ‘NotReady’, so to make it active. We must install CNI (Container Network Interface) or network add-on plugins like Calico, Flannel and Weave-net.

# Install Calico Pod Network Add-on
# $ kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

# Verify the status of pods in kube-system namespace,
# $ kubectl get pods -n kube-system

# Perfect, check the nodes status as well.
# $ kubectl get nodes

# Test Kubernetes Installation
# To test Kubernetes installation, let’s try to deploy nginx based application and try to access it.
# $ kubectl create deployment nginx-app --image=nginx --replicas=2

# Check the status of nginx-app deployment
# $ kubectl get deployment nginx-app

# Expose the deployment as NodePort,
# $ kubectl expose deployment nginx-app --type=NodePort --port=80

# Run following commands to view service status
# $ kubectl get svc nginx-app

# $ kubectl describe svc nginx-app

# Use following command to access nginx based application,
# $ curl http://<woker-node-ip-addres>:31246



# To join node
# kubeadm token create --print-join-command
# kubeadm join k8s-cp.cloudbinary.io:6443 --token eiv8x1.vki2pgpefkl3kofp --discovery-token-ca-cert-hash sha256:f5840e70d9ed3f86081f3cf83040172a690fec86bfe2cb010843d60f438b7d26
