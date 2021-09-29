IMAGE_NAME = bot04

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
.PHONY: delete

test:
	docker run --rm -it --volume $(abspath .):/usr/src/app --publish-all $(IMAGE_NAME)
.PHONY: test
