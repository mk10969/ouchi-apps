##### set env #####
set shell := ["bash", "-uc"]


##### variables ######
app_version                     := "v1.0.0"
### apps ###
argocd_version                  := "v2.1.2"
argocd_notification_version     := "v1.1.1"
cert_manager_version            := "v1.5.3"
grafana_operator_version        := "v3.10.3"


##### commands ######
# app version
version:
    @echo {{ app_version }}

# git tag
tag:
    git tag -a {{ app_version }} -m 'version up'

# tag push
push:
    git push origin {{ app_version }}

# argocd update
argocd:
    curl -sfL -o ./argocd/base/upstream/install.yaml \
        https://raw.githubusercontent.com/argoproj/argo-cd/{{ argocd_version }}/manifests/install.yaml

#  argocd-notification update
argocd-notification:
    curl -sfL -o ./argocd-notification/base/upstream/01-install.yaml \
        https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/{{ argocd_notification_version }}/manifests/install.yaml
    curl -sfL -o ./argocd-notification/base/upstream/02-configmap.yaml \
        https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/{{ argocd_notification_version }}/catalog/install.yaml

# cert-manager update
cert-manager:
    curl -sLf -o ./cert-manager/base/upstream/cert-manager.yaml \
        https://github.com/jetstack/cert-manager/releases/download/{{ cert_manager_version }}/cert-manager.yaml

# grafana-operator update
grafana-operator:
    curl -sLf  -o ./grafana-operator/base/upstream/operator.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/operator.yaml
    curl -sLf -o ./grafana-operator/base/upstream/Grafana.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/crds/Grafana.yaml
    curl -sLf -o ./grafana-operator/base/upstream/GrafanaDashboard.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/crds/GrafanaDashboard.yaml
    curl -sLf -o ./grafana-operator/base/upstream/GrafanaDataSource.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/crds/GrafanaDataSource.yaml
    curl -sLf -o ./grafana-operator/base/upstream/cluster_role_aggregate_grafana_admin_edit.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/cluster_roles/cluster_role_aggregate_grafana_admin_edit.yaml
    curl -sLf -o ./grafana-operator/base/upstream/cluster_role_aggregate_grafana_view.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/cluster_roles/cluster_role_aggregate_grafana_view.yaml
    curl -sLf -o ./grafana-operator/base/upstream/cluster_role_binding_grafana_operator.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/cluster_roles/cluster_role_binding_grafana_operator.yaml
    curl -sLf -o ./grafana-operator/base/upstream/cluster_role_grafana_operator.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/cluster_roles/cluster_role_grafana_operator.yaml
    curl -sLf -o ./grafana-operator/base/upstream/role.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/roles/role.yaml
    curl -sLf -o ./grafana-operator/base/upstream/role_binding.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/roles/role_binding.yaml
    curl -sLf -o ./grafana-operator/base/upstream/service_account.yaml \
        https://raw.githubusercontent.com/integr8ly/grafana-operator/{{ grafana_operator_version }}/deploy/roles/service_account.yaml
