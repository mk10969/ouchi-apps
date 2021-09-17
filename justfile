##### set env #####
set shell := ["bash", "-uc"]


##### variables ######
ouchi_k8s_version               := "v1.1.0"
### apps ###
argocd_version                  := "v2.0.4"
argocd_notification_version     := "v1.1.1"
cert_manager_version            := "v1.5.3"
grafana_operator_version        := "v3.10.3"
ingress_controller_version      := "v1.0.0"
kube_state_metrics_version      := "v2.2.0"
metallb_version                 := "v0.10.2"
metrics_server_version          := "v0.5.0"
rook_ceph_version               := "v"
rook_tool_version               := "v"
vm_operator_version             := "v0.18.2"


##### commands ######
# app version
version:
    @echo {{ ouchi_k8s_version }}

# git tag
tag:
    git tag -a {{ ouchi_k8s_version }} -m 'version up'

# tag push
push:
    git push origin {{ ouchi_k8s_version }}

# argocd update
argocd:
    curl -sfL -o ./argocd/base/upstream/install.yaml \
        https://raw.githubusercontent.com/argoproj/argo-cd/{{ argocd_version }}/manifests/install.yaml
    sed -i -E 's/newTag: .*/newTag: {{ argocd_version }}/g' ./argocd/base/kustomization.yaml

#  argocd-notification update
argocd-notification:
    curl -sfL -o ./argocd-notification/base/upstream/install.yaml \
        https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/{{ argocd_notification_version }}/manifests/install.yaml
    curl -sfL -o ./argocd-notification/base/upstream/configmap.yaml \
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

# ingress-controller update
ingress-controller:
    curl -sfL -o ./ingress-controller/base/upstream/ingress-controller.yaml \
        https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-{{ ingress_controller_version }}/deploy/static/provider/cloud/deploy.yaml
    curl -sfL -o ./ingress-controller/base/upstream/ingress-controller-use-nodeport.yaml \
        https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-{{ ingress_controller_version }}/deploy/static/provider/baremetal/deploy.yaml

# kube-state-metrics update
kube-state-metrics:
    @echo {{ kube_state_metrics_version }}

# metallb update
metallb:
    curl -sfL -o ./metallb/base/upstream/namespace.yaml \
        https://raw.githubusercontent.com/metallb/metallb/{{ metallb_version }}/manifests/namespace.yaml
    curl -sfL -o ./metallb/base/upstream/metallb.yaml \
        https://raw.githubusercontent.com/metallb/metallb/{{ metallb_version }}/manifests/metallb.yaml

# metrics-server update
metrics-server:
    curl -sLf -o ./metrics-server/base/upstream/components.yaml \
        https://github.com/kubernetes-sigs/metrics-server/releases/download/{{ metrics_server_version }}/components.yaml

# rook-ceph update
rook-ceph:
    @echo "rook ceph!!!"

# victoriametrics update
victoriametrics:
    curl -sLf -o ./victoriametrics/base/upstream/bundle_crd.zip \
        https://github.com/VictoriaMetrics/operator/releases/download/{{ vm_operator_version }}/bundle_crd.zip
    unzip -o -d ./victoriametrics/base/upstream/ ./victoriametrics/base/upstream/bundle_crd.zip > /dev/null 2>&1

    cp -pfr ./victoriametrics/base/upstream/release/crds/crd.yaml ./victoriametrics/base/upstream/crd.yaml
    cp -pfr ./victoriametrics/base/upstream/release/operator/manager.yaml ./victoriametrics/base/upstream/manager.yaml
    cp -pfr ./victoriametrics/base/upstream/release/operator/rbac.yaml ./victoriametrics/base/upstream/rbac.yaml

    rm -fr ./victoriametrics/base/upstream/release
    rm -fr ./victoriametrics/base/upstream/bundle_crd.zip
