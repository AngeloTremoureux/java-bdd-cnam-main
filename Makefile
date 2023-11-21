doss-java=app-java
doss-php=app-php
doss-bd=app-data
docker-php=docker-compose-php.yml
docker-java=docker-compose-java.yml
docker-global=docker-compose-global.yml

init-submodule:
	git submodule update --init --recursive $(submodule_path)

deinit-submodule:
	git submodule deinit -f -- $(submodule_path)

init-projet-java:
	$(MAKE) shutdown-docker
	$(MAKE) deinit-submodule submodule_path=$(doss-php)
	$(MAKE) init-submodule submodule_path=$(doss-bd)
	$(MAKE) init-submodule submodule_path=$(doss-java)
	$(MAKE) start-docker dc-path=$(docker-java)

init-projet-php:
	$(MAKE) shutdown-docker
	$(MAKE) deinit-submodule submodule_path=$(doss-java)
	$(MAKE) init-submodule submodule_path=$(doss-bd)
	$(MAKE) init-submodule submodule_path=$(doss-php)
	$(MAKE) start-docker dc-path=$(docker-php)

start-docker:
	docker-compose --file $(dc-path) build
	docker-compose --file $(dc-path) up

shutdown-docker:
	docker-compose -f $(docker-php) -f $(docker-java) down -v
