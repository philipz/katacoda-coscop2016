##建立 Swarm 叢集
先確認版本是否為 1.12?! `docker -v`{{execute}} 
，看一下這新 Swarm Mode 有哪些指令。 `docker swarm --help`{{execute HOST1}} 

接下來，初始化 Docker Swarm ，執行 `docker swarm init`{{execute HOST1}} 。
便會出現 Docker swarm join 的 Manager Token 和 Worker Token ，請先複製下來，在另一台伺服器加入叢集時需用到。

請選擇加入成為 Manager 或 Worker 的 Token：

Manager - `token=$(docker -H [[HOST_IP]]:2345 swarm join-token -q manager) && echo $token`{{execute HOST2}}

Worker - `token=$(docker -H [[HOST_IP]]:2345 swarm join-token -q worker) && echo $token`{{execute HOST2}}

加入到 Docker Swarm 叢集， `docker swarm join [[HOST_IP]]:2377 --token $token `{{execute HOST2}}。

叢集節點相關指令說明，`docker node -h`{{execute HOST1}}，
列出所有節點 `docker node ls`{{execute HOST1}}。
