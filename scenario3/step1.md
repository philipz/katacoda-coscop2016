##下載範例程式
首先複製投票範例程式，`git clone https://github.com/docker/example-voting-app`{{execute}}，
切換到 *example-voting-app* 目錄，`cd example-voting-app`{{execute}}，
查看是否包含 Python 語言寫的 vote 目錄，`ls -l`{{execute}}，
回到 HOME 目錄，`cd ~`{{execute}}。

##建立 Git Repo.
登入到 Github ，在 Repositories 頁面，新增一個 Repo. ，如下圖：

![git_new1](https://cloud.githubusercontent.com/assets/664465/17506273/0fefed38-5e3a-11e6-91f5-b16e0ca998a2.png)

輸入專案名稱，**circlecidemo**，再按下 *Create repository* 按鈕。

![git_name](https://cloud.githubusercontent.com/assets/664465/17505759/f1645bf0-5e35-11e6-9c99-7907a844cd7c.png)

這樣便建立好一個空的 git 儲存庫，接著複製到本地端， `git clone https://github.com/philipz/circlecitest`{{execute}}，
進入到 circlecitest 目錄， `cd circlecitest`{{execute}}。

##複製 vote 程式
將 *example-voting-app* 底下 *vote* 目錄中的所有內容，複製到 *circlecitest*，`cp -R ~/example-voting-app/vote/* ./`{{execute}} ，
便完成程式碼儲存庫的設定和配置。