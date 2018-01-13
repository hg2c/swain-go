package main

import (
	"fmt"
)

var (
	APP_NAME     = "$appName"
	VERSION      = "$version"
	BUILD_HASH   = "$buildHash"
	BUILD_BRANCH = "$buildBranch"
	BUILD_DATE   = "$buildDate"
	BUILD_TIME   = "$buildTime"
)

func Version() string {
	return fmt.Sprintf("%v %v build on %v-%v %v %v", APP_NAME, VERSION,
		BUILD_BRANCH, BUILD_HASH, BUILD_DATE, BUILD_TIME)
}
