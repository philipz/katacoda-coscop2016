請點選上方的 + 符號，選擇「Web Preview host port 80」，就可看到執行結果。
##Docker Network
啟動後，我們使用 `docker-compose ps`{{execute}} 查看這容器服務的運作狀況，必須在 *docker-compose.yml* 檔案相同的目錄才能正常執行。

接下來使用 `docker network ls`{{execute}} 
指令可看到 Docker Compose 為這範例建立了 *composedns_default* 這橋接器模式的虛擬網路，兩個容器服務都歸到相同的網段，若直接使用 `docker run -ti --rm nginx:alpine sh`{{execute}} 
所啟動的容器，其 IP 網段將與這範例不同， `ifconfig`{{execute}}。這是 Docker 針對容器所作的網路隔離特性。
##DNS
先登出 *nginx:alpine* `exit`{{execute}} 
，改進入到 *webproxy* 容器中， `docker exec -ti composedns_webproxy_1 sh`{{execute}}，
執行 `ifconfig`{{execute}} 
可看出其 IP 網段就與上面容器不同，接著查看 DNS 設定， `cat /etc/resolv.conf`{{execute}} ，
那 **127.0.0.11** 是 Docker 所內建的 DNS 伺服器，目的是為了服務探索所需要的容器名稱與 IP 對應，執行 `nslookup webapp`{{execute}} ，
就可顯示出 webapp 容器所使用的 IP ，登出此容器 `exit`{{execute}}。

接著增加 *webapp* 容器數量到 3，`docker-compose scale webapp=3`{{execute}} ，
再 `docker-compose ps`{{execute}} 
查看服務的啟動情況。再登入到 *webproxy* 容器中， `docker exec -ti composedns_webproxy_1 sh`{{execute}}，
一樣輸入 `nslookup webapp`{{execute}} ，
看看這次 webapp 的 DNS 名稱有何差異？可看出，這 DNS 紀錄增加到三個。執行 `nginx -s reload`{{execute}} ，
重新載入主機位置，使 *webproxy* 能正確對應，此刻點選上方的 + 符號，選擇「Web Preview host port 80」，重新整理可看到每次都是不同樣的結果，是以 DNS round-robin 方式循環。而這樣的功能也具備負載平衡的好處。