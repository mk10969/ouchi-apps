##### set env #####
set shell := ["bash", "-uc"]


##### variables ######
app_version                     := "v1.0.0"
### apps ###
argocd_version                  := "v2.1.2"
argocd_notification_version     := "v1.1.1"
cert_manager_version            := "v1.5.3"
grafana_operator_version        := "3.10.3"


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
    curl -sLf -o ./grafana-operator/base/upstream/tmp/grafana-operator.tar.gz \
        https://github.com/grafana-operator/grafana-operator/releases/download/v{{ grafana_operator_version }}/grafana-operator_{{ grafana_operator_version }}_linux_arm64.tar.gz


