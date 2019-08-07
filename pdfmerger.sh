#!/bin/bash

set -e
set -x

echo "#################################################"
echo "running pdfmerger"

# config
DOCKER_IMAGE='pdfmerger' # must be previously build
# DOCKER_COMMAND=sh        # run this command inside the docker conainer
DOCKER_COMMAND='python pdfmerger.py' # run this command inside the docker conainer
DOCKER_USER=$(id -u)     # run commands inside the container with this user
DOCKER_GROUP=$(id -g)    # run commands inside the container with this group
WORKDIR=${PWD}           # use this workdir inside the container
WORKDIR_MODE=rw          # mount the workdir with this mode (ro/rw)

# build docker image
echo "###### building container ####################"
docker build --pull -t "${DOCKER_IMAGE}" .

echo "###### run container  ########################"
exec docker run \
    -ti \
    -u "${DOCKER_USER}:${DOCKER_GROUP}" \
    -v "${PWD}:${WORKDIR}:rw" \
    -w "${WORKDIR}" \
    "${DOCKER_IMAGE}" \
    ${DOCKER_COMMAND} "$@"