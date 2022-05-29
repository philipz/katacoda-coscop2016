接下來，新增 *circleci.yml* 檔案，內容如下，可直接複製現成檔案。 `wget https://raw.githubusercontent.com/philipz/docker_workshop/master/circleci/circle.yml -O circle.yml`{{execute}}  
``` 
machine: 
  pre: 
    - curl -sSL https://s3.amazonaws.com/circle-downloads/install-circleci-docker.sh | bash -s -- 1.10.0 
  services: 
    - docker 
  node: 
    version: 0.10.22 
     
dependencies: 
  override: 
    - docker info 
    - docker -v 
    - docker build -t philipz/votingapp_vote . 
test: 
  override: 
    - curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose 
    - chmod +x ./docker-compose 
    - ./docker-compose -v 
    - ./docker-compose up -d 
    - npm install -g phantomjs 
    - cd test && ./tests.sh 
deployment: 
  hub: 
    branch: master 
    commands: 
      - docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS 
      - docker push philipz/votingapp_vote 
```  
那 Circle CI 已經支援 Docker 服務，為何又要重新安裝？因為 Docker Engine 要 1.10 版之後才支援 Docker Compose version 2，而 Circle CI 預設的 Docker Engine 版本太舊，所以必須自行安裝，因此仍舊需要使用 `service: - docker` 。  
 
再來配合上一個步驟的測試腳本，選擇 Node.js 環境，`node:  version: 0.10.22`。而建置程式過程都寫在 `dependencies:` 這區塊，其實只有一行 `docker build -t philipz/votingapp_vote .`。接著是測試區塊 `test:` ，先安裝新版 **Docker Compose** ，再把整個投票微服務系統執行起來， `
docker-compose up -d`，最後安裝 PhantomJS 和執行上一步驟所準備的 *tests.sh* 腳本。

##上傳到 Github
全部檔案都改寫好，就新增所有檔案， `git add *`{{execute}} ，
確認 `git commit -m "First init"`{{execute}} ，
最後上傳 `git push`{{execute}} 。