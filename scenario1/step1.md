整個微服務架構如下：

![bd3-architecture](https://cloud.githubusercontent.com/assets/664465/17456527/43d9d994-5c0d-11e6-93be-1ae31e2b666a.png)

* Python Web 程式提供兩個選項來投票
* Redis 佇列來收集 PHP 所選的新選票
* Java worker 負責監聽 Redis 的投票佇列，再轉存到 Postgres
* Postgres 資料負責持久儲存，以 Docker volume 掛載
* Node.js Web 程式即時顯示所有投票結果

##Install Docker Compose 1.8.0
依照 [Compose 文件](https://github.com/docker/compose/releases)，執行 ```curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose```{{execute}} 
和 `chmod +x ./docker-compose && sudo mv ./docker-compose /usr/local/bin/docker-compose`{{execute}} 
，完成 docker-compose 安裝，一樣確認版本 `docker-compose -v`{{execute}} 。

##複製範例庫
`git clone https://github.com/philipz/example-voting-app`{{execute}}