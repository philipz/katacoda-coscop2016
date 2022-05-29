就來逐一解說，整個建置過程的每一個環節。
## Makefile
首先是利用 **GNU Make** 來執行定義好的 *Makefile* ，其中 *Makefile* 內容如下：
```
NAME = minimal 
APP_NAME = index.js 
NODE_VERSION = 6.0.0 
 
PWD := $(shell pwd) 
 
.PHONY: all 
 
all: clean build 
 
build: 
        docker run -ti --rm -v $(PWD):/app node:$(NODE_VERSION) /app/compile.sh $(APP_NAME) $(NAME) 
        echo 'FROM scratch\nADD build.tar.gz /\nCMD ["/app/$(NAME)"]' > Dockerfile 
        docker build -t philipz/$(NAME) . 
 
clean: clean-exe clean-build 
 
clean-docker: 
        docker rmi philipz/$(NAME) 
clean-exe: 
        sudo rm -f $(NAME) 
clean-build: 
        sudo rm -rf build  
        sudo rm -f build.tar.gz
```

前面三行定義變數，可依需求修改， *NAME* 是這程式名稱，也是編譯出來的執行檔名稱，而 *APP_NAME* 是 Node.js 主程式名稱，*NODE_VERSION* 則是欲使用的 Node.js 版本，根據這版號當作 Docker 標籤(tag)來建置其映像檔。

最主要是 `docker run -ti --rm -v $(PWD):/app node:$(NODE_VERSION) /app/compile.sh $(APP_NAME) $(NAME)` ，啟動官方 node 映像檔，並掛載目前所在目錄到容器的 */app* 目錄，再執行 *compile.sh* 這 bash script 程式。下一步驟便介紹 *compile.sh* 的內容。