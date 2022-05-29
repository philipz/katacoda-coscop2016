當啟動後的容器以背景模式執行中，用 `docker ps`{{execute}} 指令可以列出所有執行中的容器，用哪個映像檔所啟動，以及運行時間等等。

這指令也會顯示自訂名稱和容器 ID ，便於使用來找出個別容器上的相關資訊。

此指令 `docker inspect <friendly-name|container-id>` 提供關於執行中容器內的更多訊息，例如 IP 位址、掛載的 volumes 和它們的相關配置及目前執行的狀態。

如果容器有撰寫其標準錯誤訊息或標準輸出，其指令 `docker logs <friendly-name|container-id>` 則可提供容器內所列出的訊息。