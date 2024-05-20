all: up

up:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

fclean: 
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker rmi mariadb:42 nginx:42 wordpress:42 || true
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/*

re: fclean all

restart:
	@docker-compose -f ./srcs/docker-compose.yml restart

status:
	@docker ps
