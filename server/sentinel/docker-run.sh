#!/bin/bash

DOCKERFILE_PATH=./
IMAGE_NAME=dev-sentinel
IMAGE_TAG=1.0

run() {
  name=$1
  sudo docker run -d --network=host -v /etc/localtime:/etc/localtime --name=${IMAGE_NAME}-${name} ${IMAGE_NAME}:${IMAGE_TAG}
}

del() {
  name=$1
  sudo docker rm -f ${IMAGE_NAME}-${name}
}

docker_name="test-01"
del $docker_name
run $docker_name

# win
# docker build --no-cache -t dev-sentinel:1.0 ./
# docker rm -f dev-sentinel
# docker run -d -p 8801:8801 --name=dev-sentinel dev-sentinel:1.0
# docker push dev-sentinel:1.0

# docker logs --tail=100 -f dev-sentinel
# docker exec -it dev-sentinel bash
