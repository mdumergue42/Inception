MARIA_DB := mariadb
NGINX := nginx
W_PRESS := wordpress

FOLDER = srcs/

DOCKERFILE_MR := $(FOLDER)$(MARIA_DB)/Dockerfile
DOCKERFILE_NG := $(FOLDER)$(NGINX)/Dockerfile
DOCKERFILE_WP := $(FOLDER)$(W_PRESS)/Dockerfile

all:
	docker compose -f $(FOLDER)docker-compose.yml up -d --build