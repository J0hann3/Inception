FROM debian:bullseye-slim

ARG version=6.4.3

RUN apt -y update && apt -y install wget; \
	wget https://wordpress.org/wordpress-$version.tar.gz; \
	tar -xzvf wordpress-$version.tar.gz; \
	rm wordpress-$version.tar.gz;

VOLUME /home/jvigny/data

EXPOSE 9000