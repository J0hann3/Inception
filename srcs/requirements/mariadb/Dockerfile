FROM debian:bullseye-slim

RUN apt -y update && apt -y install mariadb-server

VOLUME /home/jvigny/data/

COPY tools/mariadb_config.sh mariadb_config.sh

RUN chmod u+x mariadb_config.sh

ENTRYPOINT [ "./mariadb_config.sh" ]

EXPOSE 3306

CMD ["mariadb"]