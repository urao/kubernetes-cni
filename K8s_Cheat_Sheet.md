## Cheat sheet to run useful commands on K8s deployed cluster 
#### Tested on Centos 7.6 + K8s 1.15

1. Below are some of the useful commands 
```
kubectl explain deployment
kubectl explain deployment --recursive
kubectl explain deployment.spec.strategy
```
```
kubectl cluster-info dump
kubectl get componentstatus
kubectl get namespace
kubectl get pods --all-namespaces
kubectl get pods --namespace=ns-demo -o wide
kubectl get pods -n ns-demo -o wide
kubectl config view
kubectl get node k8snode01 -o yaml
kubectl get pods $PODNAME -o yaml
kubectl get pods $PODNAME -o json
kubectl get pods -l environment=lab
kubectl get pods -l 'environment in (lab, qa)'
kubectl get nodes --show-labels
kubectl describe node "nodename"
kubectl describe pod label-nginx-demo
kubectl label nodes <node-name> <label-key>=<label-value>
kubectl create -f node2-pod1.yaml
kubectl delete -f node2-pod1.yaml
kubectl replace -f node2-pod1.yaml
kubectl get pods --field-selector status.phase=Running
kubectl cordon $NODENAME
kubectl logs $PODNAME
kubectl create -f replicaset-pod.yaml --dry-run
kubectl apply -f deployment-pod.yaml
kubectl get rs
kubectl get deployments
kubectl rollout status deployment.v1.apps/nginx-deployment
kubectl edit deployment.v1.apps/nginx-deployment
kubectl exec -it nginx-deployment-7448597cd5-6k8kb bash
kubectl describe deployment $DEPLOYMENT
kubectl rollout history deployment.v1.apps/nginx-deployment
kubectl rollout undo deployment.v1.apps/nginx-deployment
kubectl get deployment nginx-deployment
kubectl scale deployment.v1.apps/nginx-deployment --replicas=10
kubectl autoscale deployment.v1.apps/nginx-deployment --min=10 --max=15 --cpu-percent=80
kubectl get deploy
kubectl rollout pause deployment.v1.apps/nginx-deployment
kubectl set resources deployment.v1.apps/nginx-deployment -c=nginx --limits=cpu=200m,memory=512Mi
kubectl rollout resume deployment.v1.apps/nginx-deployment
kubectl get rs -w
kubectl rollout status deployment.v1.apps/nginx-deployment
kubectl patch deployment.v1.apps/nginx-deployment -p '{"spec":{"progressDeadlineSeconds":600}}'
kubectl describe jobs/job-pi
pods=$(kubectl get pods --selector=job-name=job-pi --output=jsonpath='{.items[*].metadata.name}');echo $pods
kubectl get pods $PODNAME -o yaml --export
kubectl exec -it $PODNAME -- cat /etc/resolv.conf
kubectl get pods -l run=svc-nginx -o wide
kubectl get pods -l run=svc-nginx -o yaml | grep podIP
kubectl get svc
kubectl get svc $SVCNAME
kubectl describe svc $SVCNAME
kubectl get endpoints
kubectl get endpoints $SVCNAME
kubectl scale deployment $SVCNAME --replicas=0
kubectl scale deployment $SVCNAME --replicas=3
kubectl get services kube-dns --namespace=kube-system
kubectl get svc $SVCNAME -o yaml | grep nodePort -C 5
kubectl delete pod -n=kube-system coredns-fb8b8dccf-8ggcf
kubectl get pods -n kube-system -oname |grep coredns |xargs kubectl delete -n kube-system
kubectl get deployment coredns -n kube-system -o yaml > dns.yaml
kubectl get crds
kubectl exec -it $PODNAME -- /bin/bash
kubectl get virtualservices   
kubectl get destinationrules 
kubectl get gateway         
kubectl get namespace -L istio-injection
kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') \
  3000:3000 &
kubectl get virtualservice
kubectl get secrets
kubectl create namespace <ns-name>
kubectl get pod,svc -o wide -n kube-system
kubectl get MeshPolicy default
kubectl get rule -n istio-system
kubectl run np-web --image=nginx --labels app=web --expose --port 80
```

```
kubectl get nodes --show-labels 
kubectl label node 192.168.0.185 node-role.kubernetes.io/master=true
kubectl label node 192.168.0.185 node-role.kubernetes.io/master-
kubectl  get pods --no-headers=true -n kube-system
kubectl get nodes --show-labels | tail -n +2 | awk '{print $1" "$5}'
journalctl -u kubelet
```

2. Allow pods on master node
```
kubectl taint nodes --all node-role.kubernetes.io/master-
```

3. Monitor events
```
docker run -v /var/run/docker.sock:/var/run/docker.sock -ti alpine sh
apk update && apk add curl

curl --unix-socket /var/run/docker.sock http://localhost/events
```



## Reference
[Kubernetes](https://kubernetes.io/)
