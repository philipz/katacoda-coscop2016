目前為止，我們已經啟動過容器，並綁定連接埠得以連線存取，而下一個步驟就是處理資料。

容器的設計是無狀態的，容器停止之後其任何想要永久保存的資料都應儲存到伺服器主機上，這需要透過掛載/綁定伺服器目錄到容器之中才能達成。

掛載目錄（也稱為 volumes）在 Docker 中是使用 *-v :* 參數選項，類似綁定連接埠作法。當目錄掛載好，而此伺服器目錄中所存在的檔案亦可被容器所取用，容器對目錄所做得任何修改寫入都會儲存到伺服器上。這能讓您升級或修改容器，卻又不會遺失您寶貴資料。

##任務
官方 Redis 映像檔將 logs 和資料儲存在 **/data** 目錄，啟動容器並掛載那容器的目錄 /data 到伺服器的 /home/scrapbook/tutorial/data 。 

##專業建議 
Docker 允許使用 $PWD 這類位置符表示目前目錄，舉例來說，上面範例目錄可以替換成 "$PWD/data"。