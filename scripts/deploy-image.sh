#!/usr/bin/env bash
set -eu -o pipefail

source './scripts/infer.sh'

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker push ${APP_IMAGE}
