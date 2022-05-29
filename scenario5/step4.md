##擴展 Wordpress 容器數量 
 與 Docker Compose 指令類似，只需 `docker service scale wordpress=2`{{execute HOST1}}，
就完成橫向擴展，查看一下服務狀況 `docker service ps wordpress`{{execute HOST1}} 。
 
請點選另一台伺服器上方的 + 符號，選擇「Web Preview host port 80」，亦可看到 Wordpress 安裝畫面。

如果要確認 Swarm 叢集的自動負載平衡，可以登入到 Wordpress 其中一個容器，新增一個 test.html
，`echo "Test LB!" > test.html`，再用瀏覽器查看 test.html 的結果，就可發現，更新網頁兩次就會出現一次，即便在同一台伺服器上。

##捲動式更新服務(Rolling updates)
 新版 Swarm 還提供[捲動更新功能](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/)，只需要執行 
``` 
docker service update \
  --name wordpress \
  --image wordpress:latest \
  --update-delay 10s \
  --update-parallelism 1 \
  wordpress
```{{execute HOST1}} 

就可將 Wordpress 更新至最新版。

查看 Wordpress 服務更新狀況， `docker service ps wordpress`{{execute HOST1}}。