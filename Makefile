all		: up

up		: wait
	@echo "\e[0;32m -> STARTING INCEPTION SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml up -d

# build	:
# 	@docker compose -f ./srcs/docker-compose.yaml up --build -d

down	: wait
	@echo "\e[1;31m -> SHUTTING DOWN SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml down

# downv	:
# 	@docker compose -f ./srcs/docker-compose.yaml down -v

wait	:
	@echo "."
	@sleep 0.5
	@echo "."
	@sleep 0.5
	@echo "."	
	@sleep 0.5

re		: down wait up

.PHONY	: all up down re wait