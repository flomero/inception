all:
	docker compose up --build -d

down:
	docker compose down

.PHONY: all down
