在這個實驗環境中，我們將探討如何開始使用 Docker 來啟動並連接到容器。整個操作環境已經配置好 Docker Engine 和 Client，可以通過命令行存取。若要在自己的環境中安裝 Docker，請參考[官方說明文件](https://docs.docker.com/installation/)。

此正在運行 Docker 的主機名稱為 docker。如果您要存取任何服務，請務必使用 docker 來取代 localhost 或 0.0.0.0。
###什麼是 Docker？
Docker 官方網頁的解釋是“一個開放的平台，方便讓開發人員和系統管理者建置、部署，和執行分散式應用程式。” [docker.com/whatisdocker/](https://www.docker.com/whatisdocker/)。

Docker 能讓您執行容器，容器是一種沙箱程序執行著應用程式，並依附運行在伺服器作業系統之上。在容器中的應用程式會認為本身是直接在主機上運行，而應用程式會認為自己是此主機上的唯一程序，且主機可同時執行多個獨立運作的容器。由於它們是沙箱隔離，可避免依賴性間衝突發生的可能性，並簡化整個部署過程，因為所有的安裝和完成配置之時間點都能提早進行。 
 
Docker 是由三個重要元件所組成，第一個是 Docker Engine，它提供了一種便捷方式來啟動各種不同作業系統平台中的容器。第二個是 Docker Client，可以讓您跟 Engine 控制溝通。第三個是公開的 Docker Registry 負責記錄儲存 Docker 映像檔。這些映像檔可用來啟動或延伸擴展，以便滿足您自身需求及部署應用系統。
