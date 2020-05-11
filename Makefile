.PHONY: pull-images up down set-secrets deploy setup upgrade


clean:
	find . -name "*.pyc" -delete

total-clean: clean
	find . -name "*~" -o -name "*.swp" -delete

image: total-clean
	docker build -t hello_world_docker_nginx -f Dockerfile .

up:
	docker-compose -f docker-compose.yml up -d --force-recreate

down:
	docker-compose -f docker-compose.yml down -v

restart:
	docker-compose restart
