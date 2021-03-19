#!/usr/bin/env bash

# images/0/newTagは、arm64に対応してあるlatestを指定。
curl -sfL https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/manifests/install.yaml -o ./base/upstream/01-install.yaml
curl -sfL https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml -o ./base/upstream/02-configmap.yaml
