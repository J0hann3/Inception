FROM debian:bullseye

RUN apt -y update

RUN apt -y install mariadb-server

# RUN mysql_secure_installation

CMD ["service", "mariadb", "start", "&&", "mariadb"]
