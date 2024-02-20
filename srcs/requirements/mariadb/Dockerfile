FROM debian:bullseye

RUN apt -y update

RUN apt -y install mariadb-server

# RUN mysql_secure_installation
# RUN mariadb_secure_installation
RUN mysqladmin -u root password $MYSQL_ROOT_PASSWORD

CMD ["service", "mariadb", "start", "&&", "mariadb"]
