### Below are the steps to uninstall calico and deploy contrail as CNI

1. kubectl delete -f https://docs.projectcalico.org/v3.10/manifests/calico.yaml
2. modprobe -r ipip should delete tunl0 iface
3. ip route flush proto bird
4. ip link list | grep cali | awk '{print $2}' | cut -c 1-15 | xargs -I {} ip link delete {}
5. modprobe -r ipip
6. rm /etc/cni/net.d/10-calico.conflist && rm /etc/cni/net.d/calico-kubeconfig
7. systemctl restart kubelet

