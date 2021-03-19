デプロイした初回のみ、下記のコマンドを実行。

- fish
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="(openssl rand -base64 128)"
