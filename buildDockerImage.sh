#!/bin/bash
DOCKER_GOLANG_BUILDER="piersy/docker-golang-builder:1.0";
IMAGE_NAME="golang_with_docker";
BUILD_DIR="/build";

echo "Pulling ${DOCKER_GOLANG_BUILDER}"
sudo docker pull "${DOCKER_GOLANG_BUILDER}";

echo "Building ${IMAGE_NAME}"
sudo docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -v $(pwd):"${BUILD_DIR}" -t "${DOCKER_GOLANG_BUILDER}" bash -c "(cd ${BUILD_DIR} && go build) && sudo docker build -t ${IMAGE_NAME} /build"


