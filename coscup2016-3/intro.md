# 準備執行環境
1. 下載安裝 Docker Machine `sudo curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-$(uname -s)-$(uname -m) > /usr/local/bin/docker-machine && sudo chmod +x /usr/local/bin/docker-machine`{{execute}} ，[安裝說明](https://docs.docker.com/machine/install-machine/)。
2. 下載已準備好的mycert.pem：`curl -o mycert.pem http://linux.everfine.com.tw/mycert.pem`{{execute}}

參考文件：[How to use docker-machine with Azure](https://azure.microsoft.com/zh-tw/documentation/articles/virtual-machines-linux-classic-docker-machine/)