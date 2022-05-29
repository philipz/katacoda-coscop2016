##Install Docker Compose 1.8.0 
**請注意**，Docker Composer V2 需要配合 **Docker 1.10** 之後版本， 
依照 [Compose 文件](https://github.com/docker/compose/releases)，執行 ```curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose```{{execute}}  
和 `chmod +x ./docker-compose && sudo mv ./docker-compose /usr/local/bin/docker-compose`{{execute}}  
，完成 docker-compose 安裝，確認版本 `docker-compose -v`{{execute}} 。 

##Install Docker 1.12
執行 `sudo apt-get -y update`{{execute}} 
更新套件，接著安裝新版 Docker， `sudo apt-get install -y docker-engine`{{execute}} 
，選擇保留原本設定，按 `N`{{execute}} ，完成後，執行 `docker -v` 確認版本。

##複製範例程式庫 
從 Github 複製 Docker 無伺服器範例，執行 `git clone https://github.com/bfirsh/serverless-docker-voting-app`{{execute}}。 
 
##啟動範例 
切換到範例目錄， `cd serverless-docker-voting-app`{{execute}}， 
接著需輸入 `docker-compose -f docker-compose.build.yml build && docker-compose build && docker pull postgres:9.4`{{execute}}，即開始建置。