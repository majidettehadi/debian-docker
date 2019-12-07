#!/usr/bin/env bash

# Read arg from build.properties

DOCKER_VERSION=jessie

set -x
. build.properties
docker build --force-rm  \
    -t $REPO_NAME:$DOCKER_VERSION \
    --build-arg TIMEZONE=$TIMEZONE \
    --build-arg DOCKER_VERSION=$DOCKER_VERSION .
