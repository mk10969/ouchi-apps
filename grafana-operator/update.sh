#!/usr/bin/env bash

GRAFANA_VERSION="v3.9.0"

curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/operator.yaml -o ./base/upstream/operator.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/crds/Grafana.yaml -o ./base/upstream/Grafana.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/crds/GrafanaDashboard.yaml -o ./base/upstream/GrafanaDashboard.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/crds/GrafanaDataSource.yaml -o ./base/upstream/GrafanaDataSource.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/cluster_roles/cluster_role_aggregate_grafana_admin_edit.yaml -o ./base/upstream/cluster_role_aggregate_grafana_admin_edit.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/cluster_roles/cluster_role_aggregate_grafana_view.yaml -o ./base/upstream/cluster_role_aggregate_grafana_view.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/cluster_roles/cluster_role_binding_grafana_operator.yaml -o ./base/upstream/cluster_role_binding_grafana_operator.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/cluster_roles/cluster_role_grafana_operator.yaml -o ./base/upstream/cluster_role_grafana_operator.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/roles/role.yaml -o ./base/upstream/role.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/roles/role_binding.yaml -o ./base/upstream/role_binding.yaml
curl -sLf https://raw.githubusercontent.com/integr8ly/grafana-operator/$GRAFANA_VERSION/deploy/roles/service_account.yaml -o ./base/upstream/service_account.yaml
