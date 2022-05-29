## compile.sh
而 *compile.sh* script 程式，內容如下：
``` 
#!/bin/bash 
cd /app 
npm install 
npm install -g enclose 
enclose --loglevel info -o ./$2 ./$1 
./copy_ldd.sh $2 build 
cd build && tar zcf build.tar.gz * && mv build.tar.gz ../ && cd /app && rm -rf build 
exit 
```

單純只是執行 npm 及 [enclose](http://enclosejs.com/) 這套專門用來將 Node.js 編譯成執行檔的工具。 `npm install -g enclose ` 安裝好 enclose ，便用它來輸出成 $2 參數二， $(NAME) 執行檔，而 $1 參數一，則為 $(APP_NAME) Node.js 主程式名稱。
