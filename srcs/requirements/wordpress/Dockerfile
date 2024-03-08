FROM debian:bullseye-slim

ARG version=6.4.3

RUN apt -y update && apt -y install wget; \
	wget https://wordpress.org/wordpress-$version.tar.gz; \
	tar -xzvf wordpress-$version.tar.gz; \
	rm wordpress-$version.tar.gz; \
	chown -R www-data:www-data wordpress/; \
	cp wordpress/wp-config-sample.php wordpress/wp-config.php;

RUN apt install -y php7.4-fpm;

VOLUME /home/jvigny/data

COPY ./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/wordpress.conf
COPY ./tools/wordpress_config.sh /usr/local/bin/wordpress_config.sh
# RUN chmod u+x /usr/local/bin/wordpress_config.sh

EXPOSE 9000

ENTRYPOINT [ "wordpress_config.sh" ]

CMD [ "php7.4-fpm" ]