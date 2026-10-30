NAME = inception

COMPOSE = docker compose -f srcs/docker-compose.yml
DATA_DIR = /home/ael-ghaz/data

all: prepare .env
	$(COMPOSE) up -d --build

prepare:
	@mkdir -p $(DATA_DIR)/wordpress
	@mkdir -p $(DATA_DIR)/mariadb

.env:
	@if [ ! -f srcs/.env ]; then \
		cp $(DIR).en.example $(DIR).env; \
	fi

run: all

dev: prepare .env
	$(COMPOSE) up --build --watch

down:
	$(COMPOSE) down

clean: down

fclean: down
	@echo "Suppression of images, containers and volumes..."
	@docker system prune -af --volumes
	@sudo rm -rf $(DATA_DIR)

re: fclean all

.PHONY: all prepare run dev down clean fclean re
