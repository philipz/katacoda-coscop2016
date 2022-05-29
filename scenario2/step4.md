##copy_ldd.sh 
再下來執行 `copy_ldd.sh` 來分析編譯好的執行檔，由於 `copy_ldd.sh` 檔案內容較長，請自行研讀，主要目的就是將編譯好的 Node.js 程式執行檔(*minimal *)，用 **ldd** 指令分析其有關的函示庫，把相關函式庫，放到 build 目錄中，讓 `compile.sh` 可以壓縮打包成 tar.gz 檔案，便於讓 Dockerfile 以 `ADD` 指令建置出 Docker 映像檔。  
##參考文件 
[Export a linux binary with its lib dependencies to a chroot or initramfs, …](http://www.metashock.de/2012/11/export-binary-with-lib-dependencies/)