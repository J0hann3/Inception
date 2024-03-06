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

- docker compose build
- docker compose up
	- -build
- docker compose down

- docker system df	-> list images, containers, volumes, caches ...
- docker system -a -f -> remove stop container, networks , unsused images...
- docker image -a
- docker volume
- docker container





#### create VM


su
sudo usermod -aG sudo username
sudo visudo -> jvigny ALL=(ALL) ALL
sudo apt update
sudo apt install openssh-server -> config port for ssh
import ssh
sudo apt install git-all
git clone repo
set up vscode

//DOCKER
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker jvigny
newgrp docker