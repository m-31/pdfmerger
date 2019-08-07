#!/bin/sh
set -eo pipefail

# config
DOCKER_IMAGE='messier31/pdfmerger' # run this image
DOCKER_USER=$(id -u)               # run inside the container with this user
DOCKER_GROUP=$(id -g)              # run inside the container with this group
WORKDIR=${PWD}                     # use this workdir inside the container
WORKDIR_MODE=rw                    # mount the workdir with this mode (ro/rw)

exec docker run \
    -u "${DOCKER_USER}:${DOCKER_GROUP}" \
    -v "${PWD}:${WORKDIR}:${WORKDIR_MODE}" \
    -w "${WORKDIR}" \
    "${DOCKER_IMAGE}" \
    "$@"
