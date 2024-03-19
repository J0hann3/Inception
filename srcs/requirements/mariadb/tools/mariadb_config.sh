#!/bin/bash

service mariadb start

# check if mariadb is already set up
database=$(echo "SHOW DATABASES LIKE '${MYSQL_DATABASE}';" | mysql 2> /dev/null)

if [[ -z $database ]];
then
	echo "RUN mysql_secure_installation"
	# RUN mysql_secure_installation

	# set root password
	mysqladmin --user=root password ${MYSQL_ROOT_PASSWORD}

	# Remove anonyomous users
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='';"

	# Remove remote root login
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

	# Remove test database 
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"

	# Add a second users
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'wordpress.my_network' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
	GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'wordpress.my_network';"

	# Create database wordpress
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"

	# Reload privilege tables
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"


	echo "end config"
else

	echo "Database already created !"

fi

sed -i "s/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb stop

exec "$@"