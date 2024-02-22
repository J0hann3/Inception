#!/bin/bash

service mariadb start

echo "name :${MYSQL_DATABASE} | root_password :${MYSQL_ROOT_PASSWORD} | user :${MYSQL_USER} | user_password :${MYSQL_PASSWORD}"
# RUN mysql_secure_installation

# set root password
mysqladmin --user=root password ${MSQYL_ROOT_PASSWORD}
# RUN mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('$MSQYL_ROOT_PASSWORD{}') WHERE User='root';"

# Remove anonyomous users
mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='';"

# Remove remote root login
mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# Remove test database 
# mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "DROP DATABASE test;" # error
mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"

# Reload privilege tables
# mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES"

# add a second users
mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost';"

mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"

# Reload privilege tables
mysql -u root -p${MSQYL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES"