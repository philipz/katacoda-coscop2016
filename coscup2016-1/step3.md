既然是微服務架構，便可方便抽換其中一個容器服務元件，因此我們將那 **Java** 版本的 *Worker*，替換成 **.NET** 所寫的*新 Worker*，新架構如下：

![architecture](https://cloud.githubusercontent.com/assets/664465/17456546/ba03d8a4-5c0d-11e6-94a5-31f5e1432edb.png)

##改寫 docker-compose.yml
先停止之前所啟動的容器，`docker-compose down`{{execute}}，
將原本 *docker-compose.yml* 檔案中的 worker 服務，改用成 .NET 的 worker。首先將原本內容從，
```
worker: 
    build: ./worker
```
改成
```
worker.net:
    build: ./worker.net
    depends_on: 
      - redis 
      - db
```
因 worker.net 啟動很快，若沒有加上相依容器服務，會找不到其主機位置而跳出容器，產生錯誤。

為方便操作，已修改好 *docker-compose.net.yml* 檔案，查看其內容，`cat docker-compose.net.yml`{{execute}} ，
為了讓此範例運作更順利，就直接使用建置好的映象檔 **philipz/worker.net**，若想了解 .NET Worker 建置內容，可自行在電腦上重新建置，*docker-compose build*。我們直接覆蓋原本檔案，執行 `mv docker-compose.net.yml docker-compose.yml`{{execute}} ，
再次執行 `docker-compose up -d`{{execute}} 
就完成整個投票系統的替換建置。

再次點選上方的 + 符號，選擇「Web Preview host port 80」，就可看到投票執行網頁。再點選上方的 + 符號，選擇「Change Port」，會看到修改 Port 變更網頁，輸入 5000 ，按下 Display Port 就可看到投票網頁。執行 `docker-compose ps`{{execute}}  
確認整個系統狀況。