# belitsoft-demo

# Building Image
```
export NGINX_VERSION=nginx-1.20.2
docker build --build-arg NGINX_VERSION=$NGINX_VERSION -t custom-nginx .
```

# Running Container
```
docker run -d --name custom-nginx -p 80:80 -p 443:443 custom-nginx
```

# Misc Commands
```
wget http://nginx.org/download/nginx-1.20.2.tar.gz
tar -xf nginx-1.20.2.tar.gz
cd nginx-1.20.2

./configure --with-http_ssl_module --without-http_rewrite_module
make
```
