#!/usr/bin/env bash

# Read arg from build.properties

set -x
. build.properties
docker build --force-rm  \
    -t $REPO_NAME:stretch \
    --build-arg TIMEZONE=$TIMEZONE stretch
docker build --force-rm  \
    -t $REPO_NAME:jessie \
    --build-arg TIMEZONE=$TIMEZONE jessie
