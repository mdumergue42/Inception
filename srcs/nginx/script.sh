#!/bin/sh

if [ -f /etc/nginx/ssl/inception_certif.key ]; then
    echo -n ""
else
    mkdir -p /etc/nginx/ssl
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception_cerif.crt -keyout /etc/nginx/ssl/inception_certif.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=madumerg.42.fr/UID=madumerg"
fi

exec "$@"