#!/bin/bash

DOCKERFILE_PATH=./
IMAGE_NAME=dev-nacos
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
# docker build --no-cache -t dev-nacos:1.0 ./
# docker rm -f dev-nacos
# docker run -d -p 8848:8848 --name=dev-nacos dev-nacos:1.0
# docker push dev-nacos:1.0

# docker logs --tail=100 -f dev-nacos
# docker exec -it dev-nacos bash
