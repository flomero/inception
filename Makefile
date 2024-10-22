SRC_DIR = srcs

all:
	cd $(SRC_DIR) && docker compose up --build -d

down:
	cd $(SRC_DIR) && docker compose down

.PHONY: all down
