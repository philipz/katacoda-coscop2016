以 Docker 來說，所有容器都是基於 Docker 映像檔來啟動，這些映像檔包含程序啟動所需要的一切（檔案系統、相關函示庫）；主機上完全不需要任何配置設定或安裝相依程式。
 
要啟動一個容器，您可以自行建立 Docker 映像檔，或者如同這練習內容，使用由官方或其他軟體社群所建立的現存映像檔。這類事先建立好的映像檔可以在 [hub.docker.com](https://hub.docker.com/) 上搜尋，或者透過 `docker search <image-name>` 指令。舉例來說，要找尋 Redis 的相關映像檔（一種務物件關聯式資料庫系統），您可以使用 `docker search -s 1 redis | more`{{execute}}。
 
那 *-s 1* 參數是指定只顯示最少為一顆星以上的映像檔才能顯示，Docker 使用者們會在 Docker Hub 網站的專案上給予推薦星級評價，這裡建議您使用 **"Official"** 的映像檔，其經過 Docker 官方認證過所建立的，或者選一個最多星評的映像檔。

##任務
要完成這步驟，必須用官方的 Redis 映像檔以背景模式來啟動一個容器。

在使用 `search` 判斷識別使用哪個映像檔，接著您可已使用 `docker run <options> <image-name>` 啟動它。在預設情況下， Docker 將會以前景模式來執行這容器，要讓容器執行在背景模式，您需要指定 *-d* 選項，如： `docker run -d <other-options> <image-name>`。 
 
在目前階段，您仍未有任何的本地端映像檔，所以 docker 將會從 Docker Hub registry （[registry](https://docs.docker.com/registry/) 是專門存放 Docker 映像檔的伺服器，可自行架設於組織內部）上下載，如果您啟動第二個 Redis 容器，就會沿用本地端的映像檔。

##專業建議
所有容器都應該賦予一個名稱和編號以便在之後的 Docker 指令上使用，亦可輸入容器 ID 的前幾碼來識別，在啟動容器時，可透過 **--name** 參數來設定易於辨識的名稱，像是 **--name redis**。
