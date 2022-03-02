#!/usr/bin/env bash
# git clone _Book_k8sInfra.git 

git clone https://github.com/sysnet4admin/_Book_k8sInfra.git
chmod 700 _Book_k8sInfra/

kubeadm config images pull

# init kubernetes 
# kubeadm init --pod-network-cidr=10.244.0.0/16 -- apiserver-advertise-address=172.31.5.231

kubeadm init --token 123456.1234567890123456 --token-ttl 0 --pod-network-cidr=172.31.0.0/16 --apiserver-advertise-address=172.31.5.118

# config for master node only 
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

curl https://projectcalico.docs.tigera.io/manifests/calico.yaml -O
kubectl apply -f calico.yaml

# config for kubernetes's network 
# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml

# kubectl apply -f https://raw.githubusercontent.com/sysnet4admin/IaC/master/manifests/172.16_net_calico.yaml