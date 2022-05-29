在這個實驗中，了解 Docker 映像檔的建立，及其檔案系統。
##scratch
**[scratch](https://hub.docker.com/_/scratch/)** 是 Docker 映像檔之母，所有基礎映像檔(Base Image)都是由 scratch 所建置而成。它其實是一個空的映像檔，把所需要的環境將其檔案系統匯入到其中，使得依賴這樣檔案系統的程式可以正確運作。
##相關文件
1. [Create a base image](https://docs.docker.com/engine/userguide/eng-image/baseimages/)
2. [從映像檔產生 Dockerfile](https://philipzheng.gitbooks.io/docker_practice/content/dockerfile/file_from_image.html)