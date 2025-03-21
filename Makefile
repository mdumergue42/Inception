all: up

HOME := $(shell echo $$HOME)
export DATA_DIR=$(HOME)/data

up:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker compose -f ./srcs/docker-compose.yml down -v
start:
	@docker compose -f ./srcs/docker-compose.yml start
stop:
	@docker compose -f ./srcs/docker-compose.yml stop
status:
	@docker ps
fclean : down
	@rm -rf ~/data/
	@docker system prune -af
	@docker volume prune -af

clean : down
	@docker container prune -f
	@docker volume prune -af
re: stop fclean all

.PHONY: all re clean fclean
