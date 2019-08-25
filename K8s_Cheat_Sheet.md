## Cheat sheet to run useful commands on K8s deployed cluster 
#### Tested on Centos 7.6 + K8s 1.15

1. Below are some of the useful commands 
```
kubectl get namespace
kubectl get pods --all-namespaces
kubectl get pods --namespace=ns-demo -o wide
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


```

## Reference
[Kubernetes Deployment Guide](https://kubernetes.io/)
