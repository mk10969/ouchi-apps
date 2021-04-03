#!/usr/bin/env bash

PIPLINE_VERSION="v0.22.0"

curl -sfL https://storage.googleapis.com/tekton-releases/pipeline/previous/$PIPLINE_VERSION/release.yaml -o ./base/upstream/tekton-pipeline.yaml



https://github.com/tektoncd/pipeline/issues/3794
tektonは、yamlのankerを利用しており、kustomize側でサポートされていない。
なので、手動で、展開してあげる必要がある。

展開前：./base/upstream/tekton-pipeline.yaml
展開後：./base/upstream/tekton-pipeline-fix.yaml
