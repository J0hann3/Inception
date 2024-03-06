NAME = Inception

PATH_DOCKER_COMPOSE = ./srcs/docker-compose.yml

PATH_VOLUME = /home/jvigny/data/

all: $(NAME)

$(NAME):
	docker compose -f $(PATH_DOCKER_COMPOSE) up --build

up:
	docker compose -f $(PATH_DOCKER_COMPOSE) up

build:
	docker compose -f $(PATH_DOCKER_COMPOSE) build

start:
	docker compose -f $(PATH_DOCKER_COMPOSE) start

down:
	docker compose -f $(PATH_DOCKER_COMPOSE) down

stop:
	docker compose -f $(PATH_DOCKER_COMPOSE) stop

ps:
	docker compose -f $(PATH_DOCKER_COMPOSE) ps

clean:
	docker compose -f $(PATH_DOCKER_COMPOSE) down -v

fclean:	clean
	sudo rm -rf $(PATH_VOLUME)database
	sudo rm -rf $(PATH_VOLUME)wordpress
	mkdir -p $(PATH_VOLUME)database
	mkdir -p $(PATH_VOLUME)wordpress

re:	fclean all


.PHONY: all clean fclean re