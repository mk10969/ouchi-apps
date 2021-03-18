# ouchi-k8s-cd

## Manifest repository 

namespaceを各々のappに入れるか、一括で外だしして管理するか。。
→環境ごとに、namespaceを設定できるようにする。

デフォルトでnamespaceが入っているもの。
デフォルトでnamespaceが入っていないもの。
どうすっか。。

初回のみ、
1. argocd
2. argocd-app
を、順番通りに、手動でデプロイする必要がある。
その後、argocd-appに、k8sで動作するappを追加していけば、cdしてくれる。



## もしものとき
- namespaceがTerminatingで止まるとき
kubectl get namespace argocd -o json > temp.json

finalize の配列を空にする。
 
curl -H "Content-Type: application/json" -X PUT --data-binary @temp.json http://127.0.0.1:8001/api/v1/namespaces/argocd/finalize
 
 