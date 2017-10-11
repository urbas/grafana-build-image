#!/bin/bash

cd /go/src/github.com/grafana/grafana
yarn install --pure-lockfile
go run build.go -includeBuildNumber=false setup
go run build.go -includeBuildNumber=false build
go run build.go -includeBuildNumber=false package
