##啟動 Galera Cluster
瞭解了 Compose 定義檔內容，接著就是啟動這服務。執行 `docker-compose -f galera.yml up -d`{{execute}}，
等待 pull 那 Galera 映像檔後，就建置完成。

顯示服務的標準輸出結果，可執行 `docker-compose -f galera.yml logs slave`{{execute}}，
確認服務是否有錯誤訊息。

若其中有服務未完成啟動，可執行 `docker-compose -f galera.yml up -d slave`{{execute}}，
嘗試再一次啟動容器服務。

查看其服務的狀態， `docker-compose -f galera.yml ps`{{execute}}，
為何不直接執行 `docker-compose ps`{{execute}}，
反而加上 **-f galera.yml** 是因為，docker-compose 預設使用檔案名稱為 *docker-compose.yml* ，若不用此名稱，就需要透過 **-f** 指定。

確認啟動完成，再登入到容器中，確認資料庫叢集狀態，`docker exec -ti master bash`{{execute}}，
進入容器後，執行 `mysql -e 'show status like "wsrep_cluster_size"'`{{execute}}，
即顯示目前叢集數量。
