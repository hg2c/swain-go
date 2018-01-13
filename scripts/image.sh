#!/usr/bin/env bash
set -eu -o pipefail

source './scripts/project.sh'

run docker build -t ${APP_IMAGE} -f Dockerfile .
