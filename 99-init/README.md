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

2. LoadBalancerへサービスを変更(on raspi)
```
$ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
*metallbを事前にデプロイしておくとIPアドレスが割り振られる。

3. argocd cliet のインストール(on mac)
```
$ brew install argocd
```

4. argocd clietで、argocd-serverへログイン(on mac)
```
$ argocd login 192.168.3.201
```
*username: admin
*password: argocd-serverのpod名

5. argocd appを作成(on raspi)
```
kubectl apply -f 02-argocd-app.yaml
```

*下記のコマンドから、appを作成できなかった。。。
<!-- ```
$ argocd app create argocd-app --repo https://github.com/mk10969/ouchi-k8s-cd --path argocd-app/overlays/prd --dest-server https://kubernetes.default.svc --dest-namespace argocd --sync-policy automated --auto-prune
``` -->

6. argocd repository secret
GUIから、手動でユーザ名とパスワードを設定する。
<!-- argocd repo add git@github.com:mk10969/ouchi-k8s-cd.git --ssh-private-key-path ~/.ssh/id_rsa.pub -->
