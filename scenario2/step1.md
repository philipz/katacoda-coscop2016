##複製範例程式
`git clone https://github.com/philipz/node_minimal`{{execute}}
##安裝 Make 套件
`sudo apt-get install make `{{execute}}
##開始建置
先 `cd node_minimal`{{execute}} ，
接著只需要 `make`{{execute}} ，
執行完後查看是否有建置好的 Docker 映像檔 `docker images`{{execute}} ，這樣就建置好最小 Node.js 應用程式的 Docker 映像檔。
##確認
執行這最小 Node.js 應用程式的 Docker 映像檔， `docker run -d -p 80:8000 philipz/minimal`{{execute}} ，啟動後，請點選上方的 **+** 符號，選擇「Web Preview host port 80」，就可看到執行結果。

透過 `docker inspect philipz/minimal | more`{{execute}} 可以查看這映像檔的詳細資訊。