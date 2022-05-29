這練習利用之前的 [Docker 官方 Web 投票微服務範例](https://philipz.github.io/tech/2016/08/08/vote_microservice.html)，來示範如何使用 [Github](https://github.com/) 和 [CircleCI](https://circleci.com/) 
透過 Docker 容器達到軟體[持續整合](https://zh.wikipedia.org/wiki/%E6%8C%81%E7%BA%8C%E6%95%B4%E5%90%88)(Continuous Integration))和[持續交付](https://zh.wikipedia.org/wiki/%E6%8C%81%E7%BA%8C%E4%BA%A4%E4%BB%98)(Continuous Delivery)，
讓整個微服務架構中的單一容器元件可以自動化建置、測試後，上傳到企業內部的 [Docker registry server](https://github.com/docker/distribution/blob/master/docs/deploying.md) 存放映像檔，甚至呼叫 Webhook API 來自動部署營運環境。

延伸閱讀：
1. [此範例的 Github 專案](https://github.com/philipz/circlecitest)
2. [CircleCI 建置結果](https://circleci.com/gh/philipz/circlecitest)
3. [Continuous Delivery中文版](http://www.books.com.tw/products/0010653820)
4. [ThoughtWorks 的 CI 介紹](https://www.thoughtworks.com/continuous-integration )
5. [ThoughtWorks 的 CD 介紹](https://www.thoughtworks.com/continuous-delivery)