因為這投票微服務範例，包含五個容器服務元件，若不在 CI 環境上做系統整體測試，只做單元測試可能會有所疏漏，所以我們亦在 CircleCI 上使用 Docker Compose ，建置出一模一樣的環境，免除這樣的測試漏洞。所以複製 *example-voting-app* 目錄下的 **docker-compose.yml** 到 *circlecitest* 目錄中，`cp ~/example-voting-app/docker-compose.yml ./`{{execute}}。  
   
這範例主要是針對 Python 程式部分來建置 
vote 服務的 *philipz/votingapp_vote* 映像檔，所以改寫這 **docker-compose.yml** 檔案，將非 vote 服務的四個容器都採用映像檔方式，改寫成下面內容： 
```  
version: "2" 
 
services: 
  vote: 
    image: philipz/votingapp_vote 
    command: python app.py 
    ports: 
      - "5000:80" 
 
  redis: 
    image: redis:alpine 
    ports: ["6379"] 
 
  worker: 
    image: philipz/votingapp_worker 
 
  db: 
    image: postgres:9.4 
 
  result: 
    image: philipz/votingapp_result 
    ports: 
      - "80:80" 
      - "5858:5858" 
```  
可直接複製現成檔案，`wget https://raw.githubusercontent.com/philipz/docker_workshop/master/circleci/docker-compose.yml \
-O docker-compose.yml `{{execute}} 。