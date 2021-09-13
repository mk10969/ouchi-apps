# ouchi-k8s-cd

## patch LoadBalancer
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

kubectl patch svc tekton-dashboard -n tekton-pipelines -p '{"spec": {"type": "LoadBalancer"}}'




## もしものとき
- namespaceがTerminatingで止まるとき
kubectl get namespace argocd -o json > temp.json
finalize の配列を空にする。
curl -H "Content-Type: application/json" -X PUT --data-binary @temp.json http://127.0.0.1:8001/api/v1/namespaces/argocd/finalize


kubectl get namespace rook-ceph -o json > temp.json
finalize の配列を空にする。
curl -H "Content-Type: application/json" -X PUT --data-binary @temp.json http://127.0.0.1:8001/api/v1/namespaces/rook-ceph/finalize


kubectl get namespace monitoring-system -o json > temp.json
finalize の配列を空にする。
curl -H "Content-Type: application/json" -X PUT --data-binary @temp.json http://127.0.0.1:8001/api/v1/namespaces/monitoring-system/finalize
 

## command
for i in (ls); sed -i -e 's/ouchi-k8s-cd/ouchi-kubernetes/g' $i; end


kubectl -n monitoring-system exec -it (kubectl -n monitoring-system get pod -l 'app=vmcluster-test-tool' -o jsonpath='{.items[0].metadata.name}') -- bash


 curl http://vmselect-vmcluster:8481/select/0/prometheus/api/v1/label/job/values |jq
 
 
## Future
Harbor: https://goharbor.io/
