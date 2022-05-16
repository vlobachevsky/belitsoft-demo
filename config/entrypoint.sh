
openssl req -x509 -nodes -days 365 -subj "/C=XX/ST=XX/O=Company,Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/nginx.pem -out /etc/ssl/certs/nginx-selfsigned.crt;
#if [ -f "/etc/ssl/certs/nginx.crt" ] || [ -f "/etc/ssl/nginx.pem" ]
#then
#	openssl req -x509 -nodes -days 365 -subj "/C=XX/ST=XX/O=Company,Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/nginx.pem -out /etc/ssl/certs/nginx-selfsigned.crt;
#fi

nginx -g 'daemon off;'; nginx -s reload;