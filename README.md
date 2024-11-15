<h1 align=center>💻 Inception</h1>
<p align="center">
  <img src="img/inception.png?raw=true" alt="Inception Project Image"/>
</p>

## About
>This document is a System Administration related exercise.

[Subject Inception Project 42](Inception.pdf)

The goal is to recreate three Docker images for running MariaDB, Nginx, and WordPress, interconnected using Docker Compose.

## Features
- **Description**: Use Docker Compose to orchestrate three Docker images that serve a WordPress site.
- **Feature**:
	- Nginx: Redirects users to the WordPress site.
	- WordPress: Provides the frontend for the website.
	- MariaDB: Stores website data in a database.
- **How to Use**: Run `docker compose up --build` to start all the Docker containers simultaneously, then access Wordpress at `https://localhost:443/`.

## Setup

**Clone the Repository**:
```bash
git clone https://github.com/J0hann3/Inception.git;
cd  Inception
```

## Usage

For this project, a virtual machine was used to ensure access to `sudo` commands and port 443.

1. Build and start the Docker containers:
	```bash
	docker compose up --build
	```
2. Access the webiste at `https://localhost:433/`.

## New Notion

### Docker Basics
---
#### Docker commands
- `docker ps` -> List running containers.
	- `-a` -> Show all containers.
	- `-q` -> Display only container IDs.
- `docker build -t <name> <directory>` -> Build a container image from the Dockerfile.
	- `--name <name>` -> Assign a name to the container.
- `docker run <name>` -> Run a container from a built image.
	- `-p <8080:30>` -> Expose a port to the host.
	- `-it` -> Run the container interactively.
	- `--rm` ->  Remove the container automatically when it stops.
- `docker stop <id>` -> Stop a running container.
- `docker rm <id>` -> Remove a stopped container by its ID.
	- `-f` -> Force stop and remove the container.

- `docker compose build` -> Build all services defined in the docker-compose.yml file.
- `docker compose up` -> Start all services defined in the Docker Compose file.
	- `-build` -> Build the images before starting the services.
- `docker compose down` -> Stop and remove all running services.

- `docker system df` -> Show Docker system resource usage (images, containers, volumes, etc.).
- `docker system prune -a -f` ->  Remove unused images, containers, networks, and caches.
- `docker image -a` -> List all Docker images.
- `docker volume` -> List all Docker volumes.

---
#### Dockerfile
A Dockerfile will create an image to run a container.
##### **Key words**:
- `FROM` ->  Specifies the base image to use.
	- `FROM scratch` -> Start from an empty base image.
	- `FROM <name>:<version>` -> Use a specific base image and version.
- `ADD` ->Copy files or directories (local or remote) into the image.
	- `ADD config/ /ect/config/`
- `COPY` -> Copy files or directories into the image.
	- `COPY config/ /ect/config/`
	- **Best Practice**: Use `COPY` instead of `ADD` for local files to avoid unintended remote downloads.
- `WORKDIR` -> Set the working directory for subsequent instructions.
	- `WORKDIR ./data`
- `ARG` -> Define build-time variables.
	- `ARG key=value`
- `ENV` -> Define environment variables.
	- `ENV key=value`
- `USER` -> Specify the user to run commands inside the container.
	- `USER nginx`
- `EXPOSE` ->  Declare a port for the container to listen on.
	- `EXPOSE 80/tcp`
- `VOLUME` -> Define mount points to persist data.
	- `VOLUME ["/var/www", "/var/log/test", "/etc/hey"]`
- `RUN` ->  Execute commands during the build process.
	- `RUN apt update && apt install git`
- `CMD` -> Specify the command to run when the container starts.
	- `CMD ["python3", "-m", "flsak", "run"]`
