#!/usr/bin/env bash

# Read arg from build.properties

set -x
. build.properties
docker build --force-rm  \
    -t $REPO_NAME:stretch \
    --build-arg DEBIAN_VERSION=stretch \
    --build-arg TIMEZONE=$TIMEZONE .
docker build --force-rm  \
    -t $REPO_NAME:jessie \
    --build-arg DEBIAN_VERSION=jessie \
    --build-arg TIMEZONE=$TIMEZONE .
