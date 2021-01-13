#!/bin/bash 

set -ex

function download () {
  local to=$1
  local url=$2

  curl -fSL --output "${to}" "${url}"
}

mkdir -p dist

download dist/promu-0.5.0.linux-amd64.tar.gz https://dl.wodcloud.com/beagle/promu/promu-0.5.0.linux-amd64.tar.gz
cd dist
tar zxf promu-0.5.0.linux-amd64.tar.gz
mv promu-0.5.0.linux-amd64/promu $GOPATH/bin/promu
cd ..

export GOARCH=amd64
make build
mv node_exporter dist/node_exporter-linux-$GOARCH

export GOARCH=arm64
make build
mv node_exporter dist/node_exporter-linux-$GOARCH

export GOARCH=ppc64le
make build
mv node_exporter dist/node_exporter-linux-$GOARCH

export GOARCH=mips64le
make build
mv node_exporter dist/node_exporter-linux-$GOARCH