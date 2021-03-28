#!/usr/bin/env bash

CERT_MANAGER_VERSION="v1.1.1"

curl -sLf https://github.com/jetstack/cert-manager/releases/download/$CERT_MANAGER_VERSION/cert-manager.yaml -o ./base/upstream/cert-manager.yaml
