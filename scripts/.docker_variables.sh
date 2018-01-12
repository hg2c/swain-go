#!/usr/bin/env bash
set -eu

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     goos=linux;;
    Darwin*)    goos=darwin;;
    *)          goos=windows
esac

export DOCKER_BUILD_IMAGE="hg2c/golang:alpine"
export GOOS=$goos
