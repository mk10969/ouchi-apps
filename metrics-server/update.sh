#!/usr/bin/env bash

METRICS_SERVER_VERSION="v0.4.2"

curl -sLf https://github.com/kubernetes-sigs/metrics-server/releases/download/$METRICS_SERVER_VERSION/components.yaml -o ./base/upstream/components.yaml
