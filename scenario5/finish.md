此示範將上一個只適用於開發測試環境的範例，使用 Docker Swarm 容器協同運作管理工具，部署到多台虛擬主機上。

亦善用這 overlay 層疊網路，很輕鬆就可配置出可動態擴展的架構，並且無須額外設定，即可達到動態配置和負載平衡。

各位可嘗試將[投票微服務範例](https://editor.katacoda.com/editor/docker/courses/docker2016/1)改成 Swarm 服務，而目前 Docker Compose 定義檔部署到 Swarm Cluster，需先轉成 [Distributed Application Bundles(DAB)](https://blog.docker.com/2016/06/docker-app-bundle/) 檔案格式，且仍處於[實驗階段](https://github.com/docker/docker/releases)。不過 Docker Compose 已經可以產生出 DAB 檔案， **docker-compose bundle -h**。