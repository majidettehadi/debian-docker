#!/usr/bin/env bash

# Read arg from build.properties
# DEBIAN_VERSION must be stretch or jessie

set -x
. build.properties
docker build --force-rm  \
    -t $REPO_NAME:$DEBIAN_VERSION \
    --build-arg DEBIAN_VERSION=$DEBIAN_VERSION \
    --build-arg TIMEZONE=$TIMEZONE .
