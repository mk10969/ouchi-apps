#!/usr/bin/env bash

DASHBOARD_VERSION="v0.15.0"

curl -sfL https://github.com/tektoncd/dashboard/releases/download/$DASHBOARD_VERSION/tekton-dashboard-release.yaml -o ./base/upstream/tekton-dashboard.yaml
