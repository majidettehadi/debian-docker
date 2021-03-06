#!/usr/bin/env bash

# Push both debian images according to repo name
set -x
. build.properties
docker push $REPO_NAME:buster
docker push $REPO_NAME:stretch
docker push $REPO_NAME:jessie
