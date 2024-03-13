FROM debian:bullseye

RUN apt -y update; \
	apt -y install nginx; \
	apt -y install openssl;

VOLUME /var/www/html

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/wordpress.key \
		-x509 -days 365 -sha256 \
		-out /etc/nginx/ssl/wordpress.crt \
		-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/";

RUN rm /etc/nginx/sites-enabled/*

COPY ./conf/nginx.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]