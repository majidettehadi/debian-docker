#!/usr/bin/env bash

# Read arg from build.properties

DOCKER_VERSION=stretch

set -x
. build.properties
docker build --force-rm  \
    -t $REPO_NAME:$DOCKER_VERSION \
    --build-arg TIMEZONE=$TIMEZONE \
    --build-arg DEBIAN_VERSION=$DOCKER_VERSION .
