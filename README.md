# ouchi-apps

The applications is part of running on kubernetes.
The manifests are organized for [Kustomize](https://github.com/kubernetes-sigs/kustomize) and [Argo CD](https://github.com/argoproj/argo-cd).

## Applications

| app                 | status | description                                                  |
| ------------------- | ------ | ------------------------------------------------------------ |
| argocd              | ✅      | GitOps.                                                      |
| argocd-app          | ✅      | Declarative CD app.                                          |
| argocd-notification | ✅      | Notification app to slack                                    |
| cert-manager        | ✅      | App to add certificates and certificate issuers.             |
| grafana             | ✅      | Data visualization app. Visualize metrics, logs, and traces. |
| ingress-controller  | ✅      | A reverse proxy and load balancer.                           |
| kube-state-metrics  | ✅      | Cluster-level metrics.                                       |
| metallb             | ✅      | A network load-balancer.                                     |
| metrics-server      | ✅      | Container resource metrics.                                  |
| rook-ceph           | 🚧      | Block and object storage management app.                     |
| rook-tool           | 🚧      | Rook toolbox.                                                |
| victoriametrics     | ✅      | Monitoring app and Time series database.                     |
| ---- Future -----   | ---    | -                                                            |
| Istio               | ---    | Service mesh. the others...Envoy or Linkerd                  |
| kafka               | ---    | Message broker                                               |

