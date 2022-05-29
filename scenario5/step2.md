##新增 Docker Network
查看 Docekr Network 相關指令，`docker network -h`{{execute HOST1}}，
執行 `docker network create -d overlay galera`{{execute HOST1}}，
新增名為 galera 的層疊網路。

與上個練習中的 `docker network create mysql` 指令不同，須指定 overlay 層疊網路之驅動器，才能在 Swarm Cluster 中跨伺服器。

確認內容 `docker network ls`{{execute HOST1}} ，
若在上一步驟，以不同身分(Manager 和 Worker)加入，所產生的結果會有所不同，當以 Manager 身分加入，會立即同步其 Docker Network 的設定，因為其 Manager 的 K/V 是立即同步，若以 Worker 身分加入，則在服務部署到其伺服器時，才會生效。查看另一台 `docker network ls`{{execute HOST2}}，
詳細說明，請參閱[Understand Docker container networks](https://docs.docker.com/engine/userguide/networking/)。

##啟動 Galera 相關服務
###Master
所有的 Swarm 服務都必須在 Manager 上操作，而 Manager 數量建議為三台以上，原因請見[拜占庭將軍問題](http://www.twword.com/wiki/%E6%8B%9C%E5%8D%A0%E5%BA%AD%E5%B0%87%E8%BB%8D%E5%95%8F%E9%A1%8C)，由 [Leslie Lamport](http://news.sciencenet.cn/htmlnews/2015/12/333114.shtm) 所提出。
執行 `docker service create --name master --network galera erkules/galera:basic --wsrep-cluster-name=local-test --wsrep-cluster-address=gcomm://`{{execute HOST1}}

查看服務清單，`docker service ls`{{execute HOST1}}，
確認 Master 服務狀況 `docker service ps master`{{execute HOST1}}。

###Galera
`docker service create --name galera --network galera erkules/galera:basic --wsrep-cluster-name=local-test --wsrep-cluster-address=gcomm://master`{{execute HOST1}} 

檢查其狀況 `docker service ps galera`{{execute HOST1}} 、
`docker service ls`{{execute HOST1}} 

##確認 Galera Cluster 數量

查看容器狀況 `docker ps`{{execute HOST1}}，
登入到 Master 容器中，`docker exec -ti XXXXX bash`，
執行 `mysql -e 'show status like "wsrep_cluster_size"'`{{execute HOST1}}，
確認 DB 叢集狀況。

同樣的步驟，亦在另一台伺服器上執行。`docker ps`{{execute HOST2}}，
`docker exec -ti XXXXX bash`，`mysql -e 'show status like "wsrep_cluster_size"'`{{execute HOST2}}，
確認後離開`exit`{{execute HOST2}}。