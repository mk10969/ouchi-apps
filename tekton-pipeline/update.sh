#!/usr/bin/env bash

PIPLINE_VERSION="v0.23.0"

curl -sfL https://storage.googleapis.com/tekton-releases/pipeline/previous/$PIPLINE_VERSION/release.yaml -o ./base/upstream/tekton-pipeline.yaml
