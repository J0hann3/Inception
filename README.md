# Inception

## New Notion

### Docker

#### Dockerfile

- FROM -> in first, define the start image
	- FROM scratch =>without any image
	- FROM name:version
- ADD -> add file ou folder (url or git) to the container
	- ADD config/ /ect/config/
- COPY -> add file or folder to the container
	- COPY config/ /ect/config/
	- best to use COPY instead of ADD to avoid add distant file
- WORKDIR -> define workdir directory for the next instrctions
	- WORKDIR ./data
- ARG -> define variable in dockerfile
	- ARG key=value
- ENV -> define environement variable
	- ENV key=value
- USER -> define the user who run the next commends
	- USER jvigny
- EXPOSE -> add listenning port
	- EXPOSE 80/tcp

- VOLUME -> add volume to the container
	- VOLUME ["/var/www", "/var/log/test", "/etc/hey"]
- RUN -> run command shell
	- RUN apt update && apt install git
- CMD -> run processus in the container
	- CMD ["python3", "-m", "flsak", "run"]

- docker ps
	- -a -> show all container
	- -q -> only display ID
- git build -t name directory
	- --name hey -> add name
- git run name
	- -p 8080:30
	- -it -> run the docker in interactiv mode
	- --rm -> to remove the container when its stop
- docker stop ID
- docker rm ID
	-f to stop the docker and rm at the same time

- docker compose up
- docker compose down