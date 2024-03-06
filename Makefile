all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

up:
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker system prune --volumes --force --all
	rm -rf /home/jcario/data/wordpress/*
	rm -rf /home/jcario/data/mariadb/*

re: fclean all
