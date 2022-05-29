##複製範例庫
`git clone https://github.com/philipz/compose_dns`{{execute}} ，
接著 `cd compose_dns`{{execute}} 。

##docker-compose.yml
此範例的 *docker-compose.yml* 定義檔內容如下：
```
version: '2' 
 
services: 
   webapp: 
       image: philipz/minimal 
 
   webproxy: 
       build: webproxy 
       ports: 
        - "80:80"
```
由兩個服務所構成，*webapp* 是直接使用之前建置的 **philipz/minimal** 映像檔，而 *webproxy* 則是透過 webproxy 目錄底下的內容來建置所需映像檔。
##webproxy
*webproxy* 目錄包含兩個檔案，Nginx 所需要的設定檔 *proxy.conf* 和建置映像檔的 *Dockerfile* 。其中 *proxy.conf* 設定檔內容為：
```
server {
    listen 80;

    location / {
        proxy_pass http://webapp:8000;
    }
}
```
透過 proxy_pass 功能將 HTTP request 轉送到後端的 webapp 容器的 8000 port ，單純提供 reverse proxy 功能。

而 *Dockerfile* 是以 nignx:alpine 映像檔為基礎，將上述的 *proxy.conf* 覆蓋原本的配置設定。
```
FROM nginx:alpine
RUN rm /etc/nginx/conf.d/*
COPY proxy.conf /etc/nginx/conf.d/
```
最後先建置此範例 `docker-compose build`{{execute}}
，再執行 `docker-compose up -d`{{execute}} 以背景模式運行。