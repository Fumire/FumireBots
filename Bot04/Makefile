IMAGE_NAME = bot04
CONTAINER_NAME = Bot04

all:
.PHONY += all

build: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

start:
	docker run --name $(CONTAINER_NAME) --rm --detach --volume $(abspath .):/usr/src/app --publish 1234:3306 $(IMAGE_NAME)

test:
	docker run --name $(CONTAINER_NAME) --rm -it --volume $(abspath .):/usr/src/app --publish 1234:3306 $(IMAGE_NAME)


stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
