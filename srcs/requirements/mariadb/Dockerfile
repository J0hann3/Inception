FROM debian:bullseye

RUN apt -y update && apt -y install mariadb-server;

VOLUME /var/lib/mysql

COPY tools/mariadb_config.sh  /usr/local/bin/mariadb_config.sh

ENTRYPOINT [ "mariadb_config.sh" ]

EXPOSE 3306

CMD ["mariadbd"]