FROM debian:bullseye-slim

ARG version=6.4.3

RUN apt -y update && apt -y install wget; \
	wget https://wordpress.org/wordpress-$version.tar.gz; \
	tar -xzvf wordpress-$version.tar.gz; \
	rm wordpress-$version.tar.gz; \
	chown -R www-data:www-data wordpress/; \
	cp wordpress/wp-config-sample.php wordpress/wp-config.php

# need to install php

VOLUME /home/jvigny/data

# COPY ./conf/wp-config.php /wordpress
COPY ./tools/wordpress_config.sh ./wordpress_config.sh
RUN chmod u+x ./wordpress_config.sh

EXPOSE 9000

ENTRYPOINT [ "./wordpress_config.sh" ]