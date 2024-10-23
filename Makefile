all:
	docker compose up --build -d

down:
	docker compose down

reset:
	rm -rf database
	rm -rf web

re: down all


status:
	docker compose ps

logs:
	docker compose logs -f --tail 10

.PHONY: all down reset status logs
