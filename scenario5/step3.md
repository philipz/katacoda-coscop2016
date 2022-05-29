##準備資料庫 
再來設定 Wordpress 所需的資料庫和帳號權限。 
執行 `mysql`{{execute HOST1}}， 
資料庫：`CREATE DATABASE wordpress;`{{execute HOST1}}， 
帳號：`CREATE USER 'wordpress'@'%' IDENTIFIED BY 'PASSWORD';`{{execute HOST1}}， 
權限：`GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' WITH GRANT OPTION;`{{execute HOST1}}， 
最後跳出 mysql 程式 `exit`{{execute HOST1}}， 
並登出容器 `exit`{{execute HOST1}}。 

##啟動 Wordpress 服務
只需執行 `docker service create --name wordpress --network galera -p 80:80 -e WORDPRESS_DB_HOST=galera:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=PASSWORD wordpress:4.5`{{execute HOST1}} 
 
查看服務清單，`docker service ls`{{execute HOST1}}， 
確認 Wordpress 服務狀況 `docker service ps wordpress`{{execute HOST1}}。
請點選上方的 + 符號，選擇「Web Preview host port 80」，就可看到 Wordpress 安裝畫面。