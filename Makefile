
AFL_VERSION := 2.52b

all: image

image:
	docker build \
		--build-arg=AFL_VERSION=$(AFL_VERSION) \
		--tag=alexandrecarlton/afl:$(AFL_VERSION) \
		.
	docker tag alexandrecarlton/afl:$(AFL_VERSION) alexandrecarlton/afl:latest
