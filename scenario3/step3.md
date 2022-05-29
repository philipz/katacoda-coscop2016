在 [example-voting-app/result](https://github.com/docker/example-voting-app/tree/master/result) 目錄中，其實有 Node.js 的測試程式，主要是透過 [PhantomJS](http://phantomjs.org/) 工具來測試，跟之前一樣複製到 *circlecitest* 目錄中，`cp -R ~/example-voting-app/result/tests ./`{{execute}}，
而原本的測試腳本是在本地端使用，需改寫成適合 Circle CI 環境，首先移除掉 while 這行 **while ! timeout 1 bash -c "echo > /dev/tcp/vote/80"; do sleep 1; done** ，接著將 *http://vote* 改成 *http://localhost:5000* ，對應上一個步驟 **docker-compose.yml** 檔案中 vote 服務的 *ports:  - "5000:80"*，再將 *http://result* 改成 *http://localhost* ，正好對應 result 服務的 *ports:  - "80:80"*，改寫之後的結果如下：
```
#!/bin/sh 
curl -sS -X POST --data "vote=b" http://localhost:5000 > /dev/null 
sleep 10 
if phantomjs render.js http://localhost | grep -q '1 vote'; then 
  echo -e "\e[42m------------" 
  echo -e "\e[92mTests passed" 
  echo -e "\e[42m------------" 
  exit 0 
fi 
  echo -e "\e[41m------------" 
  echo -e "\e[91mTests failed" 
  echo -e "\e[41m------------" 
  exit 1
```
可直接複製現成檔案，`wget \
https://raw.githubusercontent.com/philipz/docker_workshop/master/circleci/tests/tests.sh \
-O ./tests/tests.sh`{{execute}} 。