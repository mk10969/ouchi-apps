#!/usr/bin/env bash

KUBE_STATE_METRICS_VERSION="v2.0.0-rc.1"

curl -sLf https://raw.githubusercontent.com/kubernetes/kube-state-metrics/$KUBE_STATE_METRICS_VERSION/examples/standard/cluster-role-binding.yaml -o ./base/upstream/cluster-role-binding.yaml
curl -sLf https://raw.githubusercontent.com/kubernetes/kube-state-metrics/$KUBE_STATE_METRICS_VERSION/examples/standard/cluster-role.yaml -o ./base/upstream/cluster-role.yaml
curl -sLf https://raw.githubusercontent.com/kubernetes/kube-state-metrics/$KUBE_STATE_METRICS_VERSION/examples/standard/deployment.yaml -o ./base/upstream/deployment.yaml
curl -sLf https://raw.githubusercontent.com/kubernetes/kube-state-metrics/$KUBE_STATE_METRICS_VERSION/examples/standard/service-account.yaml -o ./base/upstream/service-account.yaml
curl -sLf https://raw.githubusercontent.com/kubernetes/kube-state-metrics/$KUBE_STATE_METRICS_VERSION/examples/standard/service.yaml -o ./base/upstream/service.yaml
