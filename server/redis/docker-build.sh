#!/bin/bash

DOCKERFILE_PATH=./
IMAGE_NAME=dev-redis
IMAGE_TAG=1.0

sudo docker build --no-cache -t ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERFILE_PATH}
