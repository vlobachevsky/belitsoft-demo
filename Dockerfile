FROM alpine:3.15.4 AS builder
ARG NGINX_VERSION
RUN apk --update add gcc make g++ zlib-dev pcre-dev openssl-dev && \ 
	mkdir -p /tmp/nginx && \
    cd /tmp/nginx && \
	wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
	tar -zxvf ${NGINX_VERSION}.tar.gz && \
	cd /tmp/nginx/${NGINX_VERSION} && \
	./configure \
		--with-http_ssl_module && \
	make && \
	make install


FROM alpine:3.15.4
RUN apk --update add pcre && \
	mkdir -p /usr/local/nginx/ && \
	adduser -D -s /sbin/nologin nginx && \
	mkdir -p /usr/local/nginx/ssl/ && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout test-cert/ssl/private.key -out test-cert/ssl/public.pem -subj '/CN=.'
COPY --from=builder /usr/local/nginx/ /usr/local/nginx/
RUN sed -iE 's/#user\s\+nobody/user nginx/g' /usr/local/nginx/conf/nginx.conf
RUN ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
CMD ["nginx", "-g", "daemon off;"]