NAME = Inception

PATH_DOCKER_COMPOSE = ./srcs/docker-compose.yml

PATH_VOLUME = /home/jvigny/data/

DOCKER = docker compose

all: $(NAME)

$(NAME):
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) up --build

build:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) build

up:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) up

down:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) down

start:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) start

stop:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) stop

ps:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) ps

downv:
	$(DOCKER) -f $(PATH_DOCKER_COMPOSE) down -v

prune:
	docker system prune -a
	docker system df 


remove:	downv
	sudo rm -rf $(PATH_VOLUME)database
	sudo rm -rf $(PATH_VOLUME)wordpress
	mkdir -p $(PATH_VOLUME)database
	mkdir -p $(PATH_VOLUME)wordpress

re:	remove all


.PHONY: all build up down start stop ps downv prune remove re