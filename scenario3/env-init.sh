# 開始用 Docker Machine

1. 使用 Docker Machine 建立 Azure 虛擬機：`docker-machine create -d azure --azure-subscription-id="<SUBSCRIPTION_ID>" --azure-subscription-cert="mycert.pem" <YOURNAME_MACHINE>`
2. 確認是否建置完成：`docker-machine ls`{{execute}}
3. 登入到遠端虛擬機：`docker-machine ssh <YOURNAME_MACHINE>`
4. 登出後，改用 docker client 直接控制遠端 Docker daemon：`docker-machine env <YOURNAME_MACHINE>`