
  
#!/usr/bin/env bash

# config for work_nodes only 
kubeadm join --token 123456.1234567890123456 --discovery-token-unsafe-skip-ca-verification 172.31.5.118:6443