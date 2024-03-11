#!/bin/bash

rm /etc/nginx/sites-enabled/*

mkdir /etc/nginx/ssl; \
openssl req -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/wordpress.key \
	-x509 -days 365 -sha256 \
	-out /etc/nginx/ssl/wordpress.crt \
	-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/";

nginx -t

service nginx start
service nginx stop

exec "$@"