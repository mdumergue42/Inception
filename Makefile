MARIA_DB := mariadb
NGINX := nginx
W_PRESS := wordpress

HOME := $(shell echo $$HOME)
export DATA_DIR=$(HOME)/data
SRC_DIR = srcs/

DOCKERFILE_MR := $(SRC_DIR)$(MARIA_DB)/Dockerfile
DOCKERFILE_NG := $(SRC_DIR)$(NGINX)/Dockerfile
DOCKERFILE_WP := $(SRC_DIR)$(W_PRESS)/Dockerfile

all:
	docker compose -f $(SRC_DIR)docker-compose.yml up -d --build

clean: 
	docker system prune -af

fclean: clean
	docker system prune -af
	sudo rm -rf $(DATA_DIR)

re: fclean all

.PHONY: all re clean fclean