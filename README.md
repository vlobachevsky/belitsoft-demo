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
wget http://nginx.org/download/nginx-1.20.2.tar.gz
tar -xf nginx-1.20.2.tar.gz
cd nginx-1.20.2

./configure --with-http_ssl_module --without-http_rewrite_module
make
```
