all		: up

up		: wait
	@echo "\e[0;32m -> STARTING INCEPTION SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml up -d

build	:
	@docker-compose -f ./srcs/docker-compose.yaml up --build -d

down	: wait
	@echo "\e[1;31m -> SHUTTING DOWN SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml down

downv:
	@read -p "Are you sure? This command will delete the volumes (y/n) " answer; \
	if [ "$$answer" != "y" ]; then \
		echo "Aborted."; \
	else \
		echo "\e[1;31m -> SHUTTING DOWN SERVER <- \e[0m"; \
		echo "\e[1;31m ->  DELETING VOLUMES <- \e[0m"; \
		docker-compose -f ./srcs/docker-compose.yaml down -v; \
	fi

fullremove: downv
	@docker-compose -f ./srcs/docker-compose.yaml down --rmi all

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	for network in $$(docker network ls --format "{{.Name}}" | grep -vE '^(bridge|host|none)'); do \
    	docker network rm $$network; \
    done

deepclean: clean
	make clean
	yes | docker system prune

wait	:
	@echo "."
	@sleep 0.5
	@echo "."
	@sleep 0.5
	@echo "."	
	@sleep 0.5

re		: down wait up

.PHONY	: all up down re wait clean