SRC_DIR = srcs
COMPOSE_FILE=$(SRC_DIR)/docker-compose.yml

ENV_SCRIPT = $(SRC_DIR)/requirements/tools/check-env.sh
ENV_FILE = $(SRC_DIR)/.env

SECRETS_DIR = secrets

all: 
	@chmod +x $(ENV_SCRIPT)
	@./$(ENV_SCRIPT) $(ENV_FILE) && docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up --build -d

down:
	docker compose  -f $(COMPOSE_FILE) down

reset:
	rm -rf database
	rm -rf web

re: down all

secretfiles:
	touch $(SECRETS_DIR)/wp_db_password.txt
	touch $(SECRETS_DIR)/wp_admin_password.txt
	touch $(SECRETS_DIR)/wp_user_password.txt
	touch $(SECRETS_DIR)/ftp_password.txt

status:
	docker compose  -f $(COMPOSE_FILE) ps

logs:
	docker compose  -f $(COMPOSE_FILE) logs -f --tail 10

.PHONY: all down reset status logs secretfiles
