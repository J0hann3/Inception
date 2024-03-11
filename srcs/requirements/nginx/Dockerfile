FROM debian:bullseye

RUN apt -y update; \
	apt -y install nginx; \
	apt install -y openssl;

COPY ./conf/nginx.conf /etc/nginx/conf.d/wordpress.conf

COPY ./tools/nginx_conf.sh /usr/local/bin/nginx_conf.sh

ENTRYPOINT [ "nginx_conf.sh" ]

CMD ["nginx", "-g", "daemon off;"]