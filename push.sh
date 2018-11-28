#!/usr/bin/env bash

# Push image according to repo name and debian version
set -x
. build.properties
docker push $REPO_NAME:$DEBIAN_VERSION
