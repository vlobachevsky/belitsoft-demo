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
cd k8s
kubectl create configmap nginx-conf --from-file ../config/nginx.conf -o yaml --dry-run=client | kubectl apply -f -
kubectl apply -f nginx-demo-deployment.yaml
kubectl apply -f nginx-demo-service.yaml
```

# Update Nginx configuration
```
kubectl create configmap nginx-conf --from-file ./config/nginx.conf -o yaml --dry-run=client | kubectl apply -f -
kubectl rollout restart deployment/nginx-demo-deployment
```
