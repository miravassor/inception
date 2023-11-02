all:
	mkdir -p /home/avassor/data
	mkdir -p /home/avassor/data/wordpress
	mkdir -p /home/avassor/data/mariadb
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	sudo docker compose -f ./srcs/docker-compose.yml stop

up:
	sudo docker compose -f ./srcs/docker-compose.yml up

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down
	docker system prune -af

fclean:
	make clean
	sudo rm -rfd /home/avassor/data/wordpress
	sudo rm -rfd /home/avassor/data/mariadb

re:
	make fclean
	make all