#!/usr/bin/env bash

curl -sfL https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/stable/manifests/install.yaml -o ./base/upstream/install.yaml

# images/0/newTagは、arm64に対応してあるlatestを指定。