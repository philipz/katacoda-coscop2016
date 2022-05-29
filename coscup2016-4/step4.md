##準備資料庫
再來設定 Wordpress 所需的資料庫和帳號權限。
執行 `mysql`{{execute}}，
資料庫：`CREATE DATABASE wordpress;`{{execute}}，
帳號：`CREATE USER 'wordpress'@'%' IDENTIFIED BY 'PASSWORD';`{{execute}}，
權限：`GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' WITH GRANT OPTION;`{{execute}}，
最後跳出 mysql 程式 `exit`{{execute}}，
並登出容器 `exit`{{execute}}。

##Wordpress 定義檔
接著，看一下 *wordpress.yml* 內容：
```
version: "2"

services:
  wordpress:
    image: wordpress
    networks:
      - mysql
    environment:
      - WORDPRESS_DB_HOST=slave:3306
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=PASSWORD
    ports:
      - "80:80"

networks:
  mysql:
```
與之前 *galera.yml* 定義檔相同，都是使用 mysql 的層疊網路，直接利用官方 wordpress 映像檔，故需定義相關環境變數，請注意那 *WORDPRESS_DB_HOST=slave:3306* 是連線到 slave 服務容器。