echo 'In entrypoint script'

nginx -g 'daemon off;'; nginx -s reload;