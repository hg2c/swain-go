#!/usr/bin/env bash
set -eu -o pipefail

source './scripts/infer.sh'

run docker build -t ${APP_IMAGE} -f Dockerfile .
