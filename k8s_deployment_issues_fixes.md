#### If kubernetes image pull has some issues
1. Add image registry to the `kubeadm init` command as below
2. `kubeadm init --pod-network-cidr=10.222.0.0/16 --service-cidr=10.111.0.0/24 `
          `--apiserver-advertise-address=192.168.0.182 `
          `--image-repository registry.aliyuncs.com/google_containers`
          
#### Ubuntu kubernetes repo list
1. Add this `deb http://packages.cloud.google.com/apt/ kubernetes-xenial main`

#### gpg: no valid OpenPGP data found.
1. Do this `curl -4 -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`


#### CoreDNS crashing
1. Run below commands to check errors
- kubectl get pods -n kube-system
- kubectl -n kube-system describe pod coredns-576cbf47c7-xxxx
- kubectl -n kube-system logs -f coredns-576cbf47c7-nxxx
- kubectl -n kube-system describe pod kube-apiserver-masternode
2. Disable the CoreDNS loop detection
3. Edit the CoreDNS configMap 
   `kubectl -n kube-system edit configmap coredns`
3. Remove CoreDNS pods
   `kubectl -n kube-system delete pod -l k8s-app=kube-dns`

#### Get the list of the taints 
```
kubectl get nodes -o json | jq '.items[].spec'
kubectl get nodes -o json | jq '.items[].spec.taints'
kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers
kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{"\n"}{end}' 
kubectl get nodes \
-o custom-columns=NAME:.metadata.name,ARCH:.status.nodeInfo.architecture,KERNEL:.status.nodeInfo.kernelVersion,KUBLET:.status.nodeInfo.kubeletVersion,CPU:.status.capacity.cpu,RAM:.status.capacity.memory
```

#### Debug a crashloop pod
```
docker ps -a | grep private-reg
docker logs -f <container id>.  << docker logs
kubectl describe pods private-reg
kubectl --v=8 logs private-reg:
kubectl --v=8 logs ps-agent-2028336249-3pk43 --namespace=default -p
check entrypoint : kubectl logs <pod name> --namespace <ns>
```
