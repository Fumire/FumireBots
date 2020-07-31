IMAGE_NAME = bot05
CONTAINER_NAME = Bot05

all: result.json
.PHONY += all

build.log: Dockerfile
	docker build --rm --tag $(IMAGE_NAME) . | tee $@

start: run.py build.log
	docker run --name $(CONTAINER_NAME) --publish-all --rm --tty --volume $(abspath .):/result $(IMAGE_NAME)
.PHONY += all

delete: build.log 
	docker rmi $(IMAGE_NAME)
	rm -fv $<
.PHONY += delete
