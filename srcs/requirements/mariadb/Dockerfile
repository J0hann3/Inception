FROM debian:bullseye

RUN apt -y update

RUN apt -y install mariadb-server

RUN service mariadb start
## RUN mysql_secure_installation

# set root password
RUN mysqladmin --user=root password $MYSQL_ROOT_PASSWORD
RUN mysql -u root -p test -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';"

# Remove anonyomous users
RUN mysql -u root -p test -e "DELETE FROM mysql.user WHERE User='';"

# Remove remote root login
RUN mysql -u root -p test -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# Remove test database 
RUN mysql -u root -p test -e "DROP DATABASE test;"
RUN mysql -u root -p test -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"

# Reload privilege tables
RUN mysql -u root -p test -e "FLUSH PRIVILEGES"

# add a second users


CMD ["service", "mariadb", "start", "&&", "mariadb"]
