#!/bin/bash
set -euo pipefail

IMAGE_TAG=lambci/lambda:build-ruby2.5
docker run --volume "$PWD":/var/task --user "$UID:$GROUPS" "$IMAGE_TAG" '/var/task/docker-build.sh'

zip --quiet -r code.zip function.rb vendor
