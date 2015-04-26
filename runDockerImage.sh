#!/bin/bash

IMAGE_NAME="golang_with_docker"
echo "Running Image: ${IMAGE_NAME}";
docker run -d -p 8080:8080 "${IMAGE_NAME}"
