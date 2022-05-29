##啟動 Wordpress
執行 `docker-compose -f wordpress.yml up -d`{{execute}}，
等待 pull 那 Wordpress 映像檔後，便建置完成。

啟動後，執行 `docker-machine ls`{{execute}}，
用瀏覽器開啟此 IP 就可看到 Wordpress 安裝畫面，並依指示完整安裝。

##停止所有服務
都操作完成後，便先停止 Wordpress 服務，`docker-compose -f wordpress.yml down`{{execute}}，
再來停止全部 Galera 服務，`docker-compose -f galera.yml down`{{execute}}。
完成後，確認目前容器狀況，`docker ps`{{execute}}。

##合併 Galera 和 Wordpress
最後，將兩個定義檔合併成一個，請見 *galera_wordpress.yml* 內容，接著一次啟動所有服務， `docker-compose -f galera_wordpress.yml up -d`{{execute}}，
確認所有服務的狀態， `docker-compose -f galera_wordpress.yml ps`{{execute}}，
用瀏覽器開啟此虛擬機 IP ，就可看到 Wordpress 已安裝好畫面。

##動態擴展 
之前查看過資料庫叢集數量，此時動態增加 Slave 的數量，執行 `docker-compose -f galera_wordpress.yml scale wordpress=2`{{execute}}， 
擴展完成，可登入到 wordpress 容器中，加上 test.html 來驗證負載平衡功能。