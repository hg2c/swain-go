#!/usr/bin/env bash
set -eu

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# project dir. sample: /go/src/github.com/hg2c/swain-go
PRD=$( cd $CWD && cd .. && pwd)

# TODO if .project exsit
source '.project'

# /go/src/github.com/ hg2c /swain-go
INFER_AUTHOR=hg2c
# /go/src/github.com/hg2c/ swain-go
INFER_NAME=swain-go
# /go/src/ github.com/hg2c/swain-go
INFER_PACKAGE=github.com/$INFER_AUTHOR/$INFER_NAME

# parse the current git commit hash
COMMIT=`git rev-parse HEAD | cut -c 1-8`

# check if the current commit has a matching tag
TAG=$(git describe --exact-match --abbrev=0 --tags ${COMMIT} 2> /dev/null || true)

BRANCH=$(git rev-parse --abbrev-ref HEAD)

# use the matching tag as the version, if available
# VERSION=${TAG:-$BRANCH}
VERSION=${COMMIT}

# check for changed files (not untracked files)
# TODO dirty after ga .
if [ -n "$(git diff --shortstat 2> /dev/null | tail -n1)" ]; then
    COMMIT="${COMMIT}-dirty"
fi

GIT_VERSION=$VERSION
GIT_COMMIT=$COMMIT
GIT_TAG=$TAG
GIT_BRANCH=$BRANCH

BUILD_DATE=$(date '+%G-%m-%d')
BUILD_TIME=$(date '+%H:%M:%S')

VERSION=${APP_VERSION:-$GIT_VERSION}

INFER_GOOS="${GOOS:-$(go env GOHOSTOS)}"
INFER_GOARCH="${GOARCH:-$(go env GOHOSTARCH)}"


APP_NAME=${APP_NAME:-$INFER_NAME}
APP_AUTHOR=${APP_AUTHOR:-$INFER_AUTHOR}
APP_PACKAGE=${APP_PACKAGE:-$INFER_PACKAGE}
APP_IMAGE=${APP_AUTHOR}/${APP_NAME}:${GIT_COMMIT}

LDFLAGS="\
-X main.APP_NAME=$APP_NAME \
-X main.VERSION=$VERSION \
-X main.BUILD_HASH=$GIT_COMMIT \
-X main.BUILD_BRANCH=$GIT_BRANCH \
-X main.BUILD_DATE=$BUILD_DATE \
-X main.BUILD_TIME=$BUILD_TIME \
"

run() { echo $@ && eval $@; }
