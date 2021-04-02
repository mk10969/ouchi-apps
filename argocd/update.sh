#!/usr/bin/env bash

ARGOCD_VERSION="v2.0.0-rc2"

curl -sfL https://raw.githubusercontent.com/argoproj/argo-cd/$ARGOCD_VERSION/manifests/install.yaml -o ./base/upstream/install.yaml
