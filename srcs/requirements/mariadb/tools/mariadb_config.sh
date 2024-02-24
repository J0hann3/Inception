#!/bin/bash

service mariadb start > /dev/null

# check if mariadb is already set up
database=$(echo "SHOW DATABASES LIKE '${MYSQL_DATABASE}';" | mysql 2> /dev/null)

if [[ -z $database ]];
then

	# RUN mysql_secure_installation

	# set root password
	mysqladmin --user=root password ${MYSQL_ROOT_PASSWORD}
	# mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD{}') WHERE User='root';"

	# Remove anonyomous users
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='';"

	# Remove remote root login
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

	# Remove test database 
	# mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "DROP DATABASE test;" # error
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"

	# Reload privilege tables
	# mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES"

	# Add a second users
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
	GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost';"

	# Create database wordpress
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"

	# Reload privilege tables
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES"

else

	echo "Database already created !"

fi

exec "$@"