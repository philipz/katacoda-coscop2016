切換到 example-voting-app 目錄，`cd example-voting-app`{{execute}} ，
接著只要執行 `docker-compose up -d`{{execute}} 
就完成整個投票系統建置。執行 `docker-compose ps`{{execute}} 
確認整個系統狀況。

請點選上方的 + 符號，選擇「Web Preview host port 80」，就可看到投票執行網頁。再點選上方的 + 符號，選擇「Change Port」，會看到修改 Port 變更網頁，輸入 5000 ，按下 Display Port 就可看到投票網頁。畫面如下：

![change_port](https://cloud.githubusercontent.com/assets/664465/17457101/dc2b84ba-5c1f-11e6-8b50-19d5ed691dfd.png)

##解說 docker-compose.yml
```
version: "2"

services:
  vote:
    build: ./vote
    command: python app.py
    volumes:
     - ./vote:/app
    ports:
      - "5000:80"

  redis:
    image: redis:alpine
    ports: ["6379"]

  worker:
    build: ./worker

  db:
    image: postgres:9.4

  result:
    build: ./result
    command: nodemon --debug server.js
    volumes:
      - ./result:/app
    ports:
      - "80:80"
      - "5858:5858"

```
首先，宣告此 Compose 格式為 version 2 ，必須配合 Docker Engine 1.10 之後的版本使用。接下來定義如前面所描述的五個微服務元件。
1. Vote: 使用 vote 目錄來建置映像檔，其中目錄包含 Dockerfile 及其相關程式檔案。以 Python 執行 app.py，掛載 vote 到容器的 /app 目錄中，對應本機 5000 port 到容器的 80 port。
2. Redis: 直接使用 redis:alpine 映像檔，並隨機對應本機連接埠到容器 6379 port。 
3. Worker: 使用 worker 目錄建置，其目錄包含 Dockerfile 、 src 目錄程式和 pom.xml 函式庫定義檔。
4. DB: 直接使用 porstgres:9.4 映像檔。
5. Result: 使用 result 目錄建置，其目錄除了 Node.js 相關程式，還包含測試程式(tests目錄)，預設執行 `nodemon --debug server.js` ，並掛載 result 到容器的 /app 目錄中，對應本機 80 port 到容器的 80 port，以及 Remote debug port 5858。
