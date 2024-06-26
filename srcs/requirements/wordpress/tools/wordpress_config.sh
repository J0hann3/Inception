#!/bin/bash

if [ -f /var/www/html/wordpress/wp-config.php ]
then
	echo "wordpress already configure"
else
	cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php;
	# set connection to database
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wordpress/wp-config.php
	sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wordpress/wp-config.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wordpress/wp-config.php

	# active debug
	sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', $WORDPRESS_DEBUG );/" /var/www/html/wordpress/wp-config.php

	sed -i "0,/put your unique phrase here/s/put your unique phrase here/$AUTH_KEY/" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s/put your unique phrase here/$SECURE_AUTH_KEY/" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s/put your unique phrase here/$LOGGED_IN_KEY/" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s/put your unique phrase here/$NONCE_KEY/" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s#put your unique phrase here#$AUTH_SALT#" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s@put your unique phrase here@$SECURE_AUTH_SALT@" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s/put your unique phrase here/$LOGGED_IN_SALT/" /var/www/html/wordpress/wp-config.php
	sed -i "0,/put your unique phrase here/s|put your unique phrase here|$NONCE_SALT|" /var/www/html/wordpress/wp-config.php

	rm /etc/php/7.4/fpm/pool.d/www.conf
fi

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -t

exec "$@"