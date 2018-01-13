#!/usr/bin/env bash
set -eu -o pipefail

source './scripts/infer.sh'

docker tag ${APP_IMAGE} ${APP_IMAGE_LATEST}

docker push ${APP_IMAGE}
docker push ${APP_IMAGE_LATEST}
