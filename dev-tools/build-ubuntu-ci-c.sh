#!/bin/bash



### Configure shell
#
set -e
set -u
set -x



### Parse arguments
#
if [ "${1:-}" == "" ]; then
    echo "ERROR: Missing base image tag argument ('$0 22.04')"
    exit 1
fi
BASE_IMAGE_TAG=$1



### Build
#
docker build \
    --file Dockerfile-ubuntu-ci-c \
    --build-arg base_image_tag=$BASE_IMAGE_TAG \
    --tag ciready/ubuntu:$BASE_IMAGE_TAG-ci-c \
    .
