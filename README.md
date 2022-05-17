# belitsoft-demo

# Building Image
```
export NGINX_VERSION=nginx-1.20.2
docker build --build-arg NGINX_VERSION=$NGINX_VERSION -t vlobachevsky/nginx-demo .
docker push vlobachevsky/nginx-demo
```

# Running Container
```
docker run -d --name nginx-demo -p 80:80 vlobachevsky/nginx-demo
```

# Deploy on K8s
```
kubectl create -f nginx-demo-deployment.yaml
kubectl create -f nginx-demo-service.yaml
```

# Misc Commands
```
kubectl create configmap nginx-conf --from-file ./config/nginx.conf -o yaml --dry-run=client | kubectl apply -f -
```
