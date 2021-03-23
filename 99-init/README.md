初回時のフロー

- pre install  
$ brew install kustomize  
- prepare
$ cd ../argocd/overlays/prd  
$ kustomize build > ../../../99-init/01-install.yaml  


1. argocd本体のデブロイ(on raspi)
```
$ kubectl apply -f 01-install.yaml
```
2. metallbのデブロイ(on raspi)
```
$ kubectl apply -f 02-metallb.yaml
```
3. patch
```
$ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
4. argocd appのデブロイ(on raspi)
```
$ kubectl apply -f 03-argocd-app.yaml
```





### ほんとは、下記の手順で、他のアプリに依存したくないけど、、w
<!-- 2. pod内へ入って、argocd login(on raspi)
```
$ kubectl exec -n argocd -it argocd-server-xxxxx-yyy /bin/bash
$ argocd@argocd-server-xxxxx-yyy:~$ argocd --insecure login localhost:8080
username: admin
password: argocd-server-xxxxx-yyy
$ argocd@argocd-server-xxxxx-yyy:~$ argocd repocreds add https://github.com/mk10969/ouchi-k8s-cd/ --username mk10969 --password <github access token>
``` -->

2. pod内へ入って、argocd login(on raspi)
```
$ kubectl exec -n argocd -it argocd-server-xxxxx-yyy /bin/bash
$ argocd@argocd-server-xxxxx-yyy:~$ argocd --insecure login localhost:8080
username: admin
password: argocd-server-xxxxx-yyy
$ argocd@argocd-server-xxxxx-yyy:~$ argocd repo add https://github.com/mk10969/ouchi-k8s-cd/ --username mk10969 --password <github access token>
```

3. argocd appをデプロイ(on raspi)
```
$ argocd@argocd-server-xxxxx-yyy:~$ argocd app create argocd-app \
    --repo https://github.com/mk10969/ouchi-k8s-cd \
    --path argocd-app/prd \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace argocd \
    --sync-policy automated \
    --auto-prune \
    <!-- --revision master -->
```

### test
- port-forward experimental
argocd repo add https://github.com/mk10969/ouchi-k8s-cd/ --username mk10969 --password 8007fe2398e8f82e05f2c71183cef0676fd94f25

kubectl port-forward argocd-server-7d7fff6674-j66fw 8080:80 -n argocd
ssh -N -L 8080:100.64.1.101:8080 ubuntu@100.64.1.101
 
 