

- [Minimal Kubernetes Sidecar Demo](#minimal-kubernetes-sidecar-demo)
- [Wallarm sidecar connectivity diagram](#wallarm-sidecar-connectivity-diagram)
- [Create an authentication file](#create-an-authentication-file)
  - [Source your file](#source-your-file)
- [Deploy Nginx Ingress](#deploy-nginx-ingress)
- [Verify Nginx Ingress components](#verify-nginx-ingress-components)
- [Install myapp using helm](#install-myapp-using-helm)
- [Verify components](#verify-components)
- [Test](#test)
- [Delete](#delete)



# Minimal Kubernetes Sidecar Demo

> During the demo we deploy Wallarm as a sidecar container for myapp application.
> We also deploy nginx ingress to send traffic to myapp application running in the k8s nodes

# Wallarm sidecar connectivity diagram

![wallarm sidecar](wallarm_sidecar_diagram.png)

# Create an authentication file

`vi auth`

And add the following

```
export WC_DEPLOY_USER="your@email.com" 
export WC_DEPLOY_PASSWORD='your_wallarm_console_pwd'
```

## Source your file
. ./auth
# Deploy Nginx Ingress

> The following command will deploy nginx ingress in our K8s cluster

```
kubectl apply -f ingress-nginx.yaml
```

# Verify Nginx Ingress components

```
kubectl get pods -n ingress-nginx -o wide
```
```
NAME                                      READY   STATUS      RESTARTS   AGE   IP               NODE                      NOMINATED NODE   READINESS GATES
ingress-nginx-admission-create-t2dbm      0/1     Completed   0          69m   192.168.57.198   node-5aa745e0.localhost   <none>           <none>
ingress-nginx-admission-patch-w28nw       0/1     Completed   0          69m   192.168.57.199   node-5aa745e0.localhost   <none>           <none>
ingress-nginx-controller-b6b89475-4cbgc   1/1     Running     0          69m   192.168.55.206   node-249068d6.localhost   <none>           <none>
ingress-nginx-controller-b6b89475-5cwhn   1/1     Running     0          69m   192.168.57.200   node-5aa745e0.localhost   <none>           <none>

```

# Install myapp using helm

```
sh run.sh
```

# Verify components
```
kubectl get pods
```
```
NAME                     READY   STATUS    RESTARTS   AGE
myapp-5894b59747-blrxt   2/2     Running   0          66m
```


# Test 

```
sh test.sh
```

# Delete 

```
sh delete.sh
kubectl delete -f ingress-nginx.yaml
```


> For more information: https://docs.wallarm.com/admin-en/installation-guides/kubernetes/wallarm-sidecar-container/

