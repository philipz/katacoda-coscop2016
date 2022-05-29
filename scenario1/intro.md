出處：[Wiki](https://zh.wikipedia.org/wiki/%E5%BE%AE%E6%9C%8D%E5%8B%99)

微服務 (Microservices) 是一種軟體架構風格 (Software Architecture Style)，它是以專注於單一責任與功能的小型功能區塊 (Small Building Blocks) 為基礎，利用模組化的方式組合出複雜的大型應用程式，各功能區塊使用與語言無關 (Language-Independent/Language agnostic) 的 API 集相互通訊。

而 [Docker Birthday #3](https://github.com/docker/docker-birthday-3) 所提供的 Voting 範例就是以微服務方式所設計，結合 PHP、Redis、Jave、Node.js 和 Postgres ，五個單一責任的容器，組合出這一個 Web 投票系統。