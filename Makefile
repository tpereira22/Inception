all		: build

build		: wait
	@echo "\e[0;32m -> STARTING INCEPTION SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml up --build -d

up	: wait
	@echo "\e[0;32m -> STARTING INCEPTION SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml up -d

down	: wait
	@echo "\e[1;31m -> SHUTTING DOWN SERVER <- \e[0m"
	@docker-compose -f ./srcs/docker-compose.yaml down

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

.PHONY	: all build up down clean deepclean wait