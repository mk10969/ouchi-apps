#!/usr/bin/env bash

VM_VERSION="v0.12.2"

curl -sLf https://github.com/VictoriaMetrics/operator/releases/download/$VM_VERSION/bundle_crd.zip -o ./base/upstream/bundle_crd.zip
unzip ./base/upstream/bundle_crd.zip -d ./base/upstream/

cp -pfr ./base/upstream/release/crds/crd.yaml ./base/upstream/crd.yaml
cp -pfr ./base/upstream/release/operator/manager.yaml ./base/upstream/manager.yaml
cp -pfr ./base/upstream/release/operator/rbac.yaml ./base/upstream/rbac.yaml

rm -fr ./base/upstream/release
rm -fr ./base/upstream/bundle_crd.zip
