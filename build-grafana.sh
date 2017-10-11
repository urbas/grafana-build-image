#!/bin/bash

cd /go/src/github.com/grafana/grafana
yarn install --pure-lockfile
go run build.go setup
go run build.go build
go run build.go package "$@"
