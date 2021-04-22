#!/usr/bin/env bash

ROOK_VERSION="v1.6.0"

curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/common.yaml -o ./base/upstream/common.yaml
curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/crds.yaml -o ./base/upstream/crds.yaml
curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/operator.yaml -o ./base/upstream/operator.yaml

curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/cluster-test.yaml -o ./base/upstream/cluster-test.yaml
curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/cluster.yaml -o ./base/upstream/cluster.yaml

curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/csi/rbd/storageclass.yaml -o ./base/upstream/ceph-block-pool.yaml
curl -sfL https://raw.githubusercontent.com/rook/rook/$ROOK_VERSION/cluster/examples/kubernetes/ceph/csi/rbd/storageclass-test.yaml -o ./base/upstream/ceph-block-pool-test.yaml
