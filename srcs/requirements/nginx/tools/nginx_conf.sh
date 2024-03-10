#!/bin/bash

service nginx start

rm /etc/nginx/sites-enabled/*

service nginx stop

nginx -t

exec "$@"