#!/usr/bin/env bash

PIPLINE_VERSION="v0.22.0"
TRIGGER_VERSION="v0.12.1"
DASHBOARD_VERSION="v0.15.0"

curl -sfL https://storage.googleapis.com/tekton-releases/pipeline/previous/$PIPLINE_VERSION/release.yaml -o ./base/upstream/01-pipeline.yaml
curl -sfL https://storage.googleapis.com/tekton-releases/triggers/previous/$TRIGGER_VERSION/release.yaml -o ./base/upstream/02-triggers.yaml
curl -sfL https://github.com/tektoncd/dashboard/releases/download/$DASHBOARD_VERSION/tekton-dashboard-release.yaml -o ./base/upstream/03-dashboard.yaml
