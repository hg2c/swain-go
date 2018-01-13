#!/usr/bin/env bash
set -eu

source './scripts/infer.sh'

build() {
    local GOOS=${1:-$INFER_GOOS}
    local GOARCH=${2:-$INFER_GOARCH}

    local TARGET="build/$APP_NAME-$GOOS-$GOARCH"

    run GOOS=$GOOS GOARCH=$GOARCH go build -o ${TARGET} -ldflags \"${LDFLAGS}\" ${APP_PACKAGE}
}

build linux
