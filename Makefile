all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker system prune --volumes --force --all
	rm -rf /home/jcario/data/wordpress/*
	rm -rf /home/jcario/data/mariadb/*

re: down all
