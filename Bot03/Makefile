IMAGE_NAME = bot03

all:
.PHONY:= all

build: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) .
.PHONY: build

delete:
	docker rmi $(IMAGE_NAME)
.PHONY: delete

start:
	docker run --rm --detach --volume $(abspath .):/usr/src/app --publish-all $(IMAGE_NAME)
.PHONY: start

test:
	docker run --rm -it --volume $(abspath .):/usr/src/app --publish 1234:3306 $(IMAGE_NAME)
