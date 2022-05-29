##Docker Network
Docker Network 是從 Docker 1.9 所新增的功能，可用來建立一個跨多台 Docker 伺服器的層疊網路，其利用 VXLAN 通訊協定。層疊技術的好處在於它提供每個容器具有相同子網路的 IP 位址，並且也能透過變更每個容器的 /etc/hosts 來管理名稱解析，因此每個容器都啟動在相同層疊網路，用各自的容器名稱,就可連線到其他任何一個容器。

執行 `docker network -h`{{execute}}
，來查看有哪些指令。

##複製範例庫
請執行 `git clone https://github.com/philipz/compose_galera_wordpress`{{execute}}，
切換到此範例目錄，`cd compose_galera_wordpress`{{execute}}，
首先，來看 galera.yml 定義檔內容：
```
version: "2"

services:
  master:
    image: erkules/galera:basic
    container_name: master
    volumes:
      - /data:/var/lib/mysql
    networks:
      - mysql
    command: --wsrep-cluster-name=local-test --wsrep-cluster-address=gcomm://

  slave:
    depends_on:
      - master
    image: erkules/galera:basic
    networks:
      - mysql
    command: --wsrep-cluster-name=local-test --wsrep-cluster-address=gcomm://master

networks:
  mysql:
```
主要是由兩個服務所組成，分別是 Master 和 Slave ，但此 Galera Cluster 是 Master-Master 資料庫架構，此命名只是方便識別。
Master 服務先啟動，方便 Slave 利用那 *Command:* `--wsrep-cluster-name=local-test --wsrep-cluster-address=gcomm://master` 來連線到 Master，並且加上 *depends_on:* 設定，確保 Master 服務啟動好，才執行 Slave 服務，相關啟動順序細節，請參閱 [Controlling startup order in Compose](https://docs.docker.com/compose/startup-order/)。

最下面 *networks:* 則是建立 Docker Network ，與 `docker network create mysql` 指令相同。而 Master 和 Slave 服務都設定在 mysql 層疊網路上。
