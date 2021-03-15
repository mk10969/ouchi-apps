#!/usr/bin/env bash

curl -L https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml -o 01-pipeline.yaml
curl -L https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml -o 02-triggers.yaml
curl -L https://github.com/tektoncd/dashboard/releases/latest/download/tekton-dashboard-release.yaml -o 03-dashboard.yaml
