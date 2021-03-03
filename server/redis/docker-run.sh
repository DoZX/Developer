#!/bin/bash

DOCKERFILE_PATH=./
IMAGE_NAME=dev-redis
IMAGE_TAG=1.0

run() {
    name=$1
    sudo docker run -d --network=host -v /etc/localtime:/etc/localtim --name=${IMAGE_NAME}-${name} ${IMAGE_NAME}:${IMAGE_TAG}
}

del() {
	name=$1
	sudo docker rm -f ${IMAGE_NAME}-${name}
}

docker_name="test-01"
del $docker_name
run $docker_name

# win
# docker build --no-cache -t dev-redis:1.0 ./
# docker rm -f dev-redis
# docker run -d -p 6379:6379 --name=dev-redis dev-redis:1.0
# docker push dev-redis:1.0

# docker logs --tail=100 -f dev-redis
# docker exec -it dev-redis bash
