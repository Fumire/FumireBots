IMAGE_NAME = bot01
CONTAINER_NAME = Bot01

all:
.PHONY += all

build: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) .
.PHONY += build

delete:
	docker rmi $(IMAGE_NAME)
.PHONY += delete

start:
	docker run --name $(CONTAINER_NAME) --detach --restart "always" --volume $(abspath .):/usr/src/app $(IMAGE_NAME)
.PHONY += start

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
