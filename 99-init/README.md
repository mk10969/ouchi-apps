初回時のフロー


1. argocd本体のデブロイ(on raspi)
```
$ kubectl apply -f init-install.yaml
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

5. argocd appを作成(on mac)
cdするappを設定することで、自動でdeployさせる。

```
$ argocd app create argocd-config \
  --repo https://github.com/mk10969/ouchi-k8s-cd \
  --path argocd-config/overlays/prd \
  --dest-namespace argocd \
  --dest-server https://kubernetes.default.svc \
  --sync-policy automated \
  --auto-prune 
```

1. asdaf


2. 

