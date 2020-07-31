IMAGE_NAME = bot06
CONTAINER_NAME = Bot06

all:
.PHONY += all

build: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

start:
	docker run --name $(CONTAINER_NAME) --rm --detach --volume $(abspath .):/usr/src/app --publish-all $(IMAGE_NAME)

test:
	docker run --name $(CONTAINER_NAME) --rm -it --volume $(abspath .):/usr/src/app --publish-all $(IMAGE_NAME)


stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
