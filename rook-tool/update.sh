#!/usr/bin/env bash

ROOK_VERSION="v1.5.9"

curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/toolbox.yaml -o ./base/upstream/toolbox.yaml
curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/dashboard-loadbalancer.yaml -o ./base/upstream/dashboard-loadbalancer.yaml
