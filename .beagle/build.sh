#!/bin/bash 

set -ex

mkdir -p dist

git apply .beagle/v1.6-promu.patch

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

git apply -R .beagle/v1.6-promu.patch