FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

USER root

VOLUME /home/jvigny/data/

EXPOSE 3306

RUN apt -y update

RUN apt -y install mariadb-server

WORKDIR /mariadb

COPY ./tools/mariadb_config.sh ./mariadb_config.sh

RUN chmod u+x ./mariadb_config.sh

ENTRYPOINT [ "./mariadb_config.sh" ]

CMD ["mysql"]
