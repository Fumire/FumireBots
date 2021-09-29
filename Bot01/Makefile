IMAGE_NAME = bot01

all:
.PHONY: all

build: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) .
.PHONY: build

delete:
	docker rmi $(IMAGE_NAME)
.PHONY: delete

start:
	docker run --detach --restart "always" --volume $(abspath .):/usr/src/app $(IMAGE_NAME)
.PHONY:= start
