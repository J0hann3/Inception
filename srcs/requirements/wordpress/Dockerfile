FROM debian:bullseye-slim

ARG version=6.4.3

RUN apt -y update && apt -y install wget; \
	wget https://wordpress.org/wordpress-$version.tar.gz; \
	mkdir -p /var/www/html/; \
	tar -xzvf wordpress-$version.tar.gz -C /var/www/html; \
	rm wordpress-$version.tar.gz; \
	chown -R www-data:www-data /var/www/html/wordpress; \
	chmod -R 755 /var/www/html/wordpress;

RUN apt-get -y install php-cli php-mysql php-curl php-gd php-intl php-fpm


VOLUME /var/www/html

COPY ./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/wordpress.conf

COPY ./tools/wordpress_config.sh /usr/local/bin/wordpress_config.sh

EXPOSE 9000

ENTRYPOINT [ "wordpress_config.sh" ]

CMD [ "php-fpm7.4", "--nodaemonize" ]