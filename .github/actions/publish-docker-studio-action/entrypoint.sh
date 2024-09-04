#!/bin/bash
docker --version
source /home/.virtualenvs/py36/bin/activate
make clean stage deps lint build-docker-studio
cat logs/packer-docker-studio.log
echo "${DOCKERHUB_TOKEN}" | docker login --username cliffano --password-stdin
docker inspect cliffano/studio
make publish-docker-studio