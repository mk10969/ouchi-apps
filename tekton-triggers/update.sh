#!/usr/bin/env bash

TRIGGERS_VERSION="v0.12.1"

curl -sfL https://storage.googleapis.com/tekton-releases/triggers/previous/$TRIGGERS_VERSION/release.yaml -o ./base/upstream/tekton-triggers.yaml
