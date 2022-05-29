##Install Docker Machine 0.8.0
為快速建立雲端虛擬機，請安裝 Docekr Machine ，執行 ```wget https://github.com/docker/machine/releases/download/v0.8.0/docker-machine-`uname -s`-`uname -m` && \ 
sudo mv docker-machine-`uname -s`-`uname -m` /usr/local/bin/docker-machine && \ 
sudo chmod +x /usr/local/bin/docker-machine```{{execute}}，
確認版本 `docker-machine -v`{{execute}} 。

##Install Docker 1.12
執行 `sudo apt-get -y update`{{execute}} 
更新套件，接著安裝新版 Docker， `sudo apt-get install -y docker-engine`{{execute}} 
，選擇保留原本設定，按 `N`{{execute}} ，完成後，執行 `docker -v` 確認版本。

##Install Docker Compose 1.8.0
Docker Composer V2 需要配合 Docker 1.10 之後版本，
依照 [Compose 文件](https://github.com/docker/compose/releases)，執行 ```curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose```{{execute}} 
和 `chmod +x ./docker-compose && sudo mv ./docker-compose /usr/local/bin/docker-compose`{{execute}} 
，完成 docker-compose 安裝，一樣確認版本 `docker-compose -v`{{execute}} 。

##建立 Azure 虛擬機
為真實模擬實際營運環境，使用 Docker Machine 快速建立 VM ，執行 `docker-machine create -d azure --azure-subscription-id="XXXXX-XXXX-XXXXX-XXXXXXX" --azure-location="westeurope" --azure-image canonical:ubuntuserver:16.04.0-LTS:16.04.201608150 --azure-size Standard_A1 --engine-install-url https://get.docker.com docker-00-node01`{{execute}}，
建立完成，利用 **docker-machine env** 指令將 Docker Engine Server 指定到遠端 Azure 主機， `eval $(docker-machine env docker-00-node01)`{{execute}}，
輸入 `docker info`{{execute}} 確認電腦資訊。