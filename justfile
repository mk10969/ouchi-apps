##### set env #####
set shell := ["bash", "-uc"]


##### variables ######
ouchi_k8s_version               := "v1.2.3"
### apps ###
argocd_version                  := "v2.2.2"
argocd_notification_version     := "v1.1.1"
cert_manager_version            := "v1.5.3"
grafana_chart_version           := "6.21.8"
ingress_controller_version      := "v1.0.0"
kube_state_metrics_version      := "v2.3.0"
metallb_version                 := "v0.12.1"
metrics_server_version          := "v0.6.1"
rook_ceph_version               := "v"
rook_tool_version               := "v"
vm_operator_version             := "v0.23.2"


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

# grafana update
grafana:
    helm repo update
    helm template grafana -n monitoring grafana/grafana --version {{ grafana_chart_version }} \
        -f ./grafana/base/configs/datasources.yaml -f ./grafana/base/configs/dashboards.yaml > ./grafana/base/upstream/grafana-template.yaml

# ingress-controller update
ingress-controller:
    curl -sfL -o ./ingress-controller/base/upstream/ingress-controller.yaml \
        https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-{{ ingress_controller_version }}/deploy/static/provider/cloud/deploy.yaml
    curl -sfL -o ./ingress-controller/base/upstream/ingress-controller-use-nodeport.yaml \
        https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-{{ ingress_controller_version }}/deploy/static/provider/baremetal/deploy.yaml

# kube-state-metrics update
kube-state-metrics:
    curl -sLf -o ./kube-state-metrics/base/upstream/cluster-role-binding.yaml \
        https://raw.githubusercontent.com/kubernetes/kube-state-metrics/{{ kube_state_metrics_version }}/examples/standard/cluster-role-binding.yaml
    curl -sLf -o ./kube-state-metrics/base/upstream/cluster-role.yaml \
        https://raw.githubusercontent.com/kubernetes/kube-state-metrics/{{ kube_state_metrics_version }}/examples/standard/cluster-role.yaml
    curl -sLf -o ./kube-state-metrics/base/upstream/deployment.yaml \
        https://raw.githubusercontent.com/kubernetes/kube-state-metrics/{{ kube_state_metrics_version }}/examples/standard/deployment.yaml
    curl -sLf -o ./kube-state-metrics/base/upstream/service-account.yaml \
        https://raw.githubusercontent.com/kubernetes/kube-state-metrics/{{ kube_state_metrics_version }}/examples/standard/service-account.yaml
    curl -sLf -o ./kube-state-metrics/base/upstream/service.yaml \
        https://raw.githubusercontent.com/kubernetes/kube-state-metrics/{{ kube_state_metrics_version }}/examples/standard/service.yaml

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
