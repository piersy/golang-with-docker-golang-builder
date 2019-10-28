#!/bin/bash

CURRENT_DIR="$(pwd)";
#remove longest match of "*/" from front of CURRENT_DIR
DIRNAME=${CURRENT_DIR##*/}

echo "Pulling docker-golang-builder"
docker pull "piersy/docker-golang-builder:1.0";
echo "Building golang_with_docker"
docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -v "${CURRENT_DIR}:/${DIRNAME}" -t "piersy/docker-golang-builder:1.0" bash -c "(cd ${DIRNAME} && go build ) && sudo docker build -t golang_with_docker /${DIRNAME}"


