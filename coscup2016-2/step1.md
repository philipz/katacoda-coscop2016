##Install Docker 1.12
執行 `sudo apt-get -y update`{{execute}} 
更新套件，接著安裝新版 Docker， `sudo apt-get install -y docker-engine`{{execute}} 
，選擇保留原本設定，按 `N`{{execute}} ，完成後，執行 `docker -v` 確認版本。
##Install Docker Compose 1.8.0
依照 [Compose 文件](https://github.com/docker/compose/releases)，執行 ```curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose```{{execute}} 
和 `chmod +x ./docker-compose && sudo mv ./docker-compose /usr/local/bin/docker-compose`{{execute}} 
，完成 docker-compose 安裝，一樣確認版本 `docker-compose -v`{{execute}}  。