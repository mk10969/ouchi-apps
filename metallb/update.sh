#!/usr/bin/env bash

# images/0/newTagは、arm64に対応してあるlatestを指定。
curl -sfL https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml -o ./base/upstream/01-namespace.yaml
curl -sfL https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml -o ./base/upstream/02-metallb.yaml
