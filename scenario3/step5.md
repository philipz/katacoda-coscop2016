最後一個步驟就是利用 [Circle CI](https://circleci.com/) 來建置並發佈到 Docker Hub 上。

##新增帳戶
按下那 *Sign Up* 按鈕：

![circle_signup](https://cloud.githubusercontent.com/assets/664465/17509832/91503752-5e4e-11e6-9879-48d3a76b0d44.png)

並直接使用 Github 帳號認證，直接按下 *Authorize with GitHub* 按鈕，便完成新增帳號。

##新增建置專案
在 [Circle CI 儀錶板](https://circleci.com/dashboard)上選擇， **ADD PROJECTS** ，點選 Github 選項。

![dashboard](https://cloud.githubusercontent.com/assets/664465/17509997/693844a2-5e4f-11e6-8e37-c70db5d31c95.png)

接著尋找 circlecitest 專案，按下 **Build project** ，就立即開始建置。
![circle_build](https://cloud.githubusercontent.com/assets/664465/17510281/df48780a-5e50-11e6-94b1-27e6e2eeee3c.png)

##發佈到 Docker Hub 設定
緊接著，若想在建置成功後，設定此建置專案的環境變數。按下專案旁的齒輪按鈕：

![circlecitest_setting](https://cloud.githubusercontent.com/assets/664465/17510772/de0beb8c-5e52-11e6-95cb-8b4602763264.png)

選擇環境變數， *Environment Variables* 

![env_var](https://cloud.githubusercontent.com/assets/664465/17510877/53b81270-5e53-11e6-9aa1-9f6fed21a687.png)

新增三組環境變數，分別是您的 Docker Hub 帳號名、 Docker Hub EMAIL 和密碼。
![dockerhub_var](https://cloud.githubusercontent.com/assets/664465/17510942/9fbb2bbc-5e53-11e6-8d49-aba64cb553fd.png)

最後就可看到建置成功並上傳的 **綠燈** 。

![green_light](https://cloud.githubusercontent.com/assets/664465/17511626/61416ec0-5e56-11e6-8b3b-dc1e37ca02cb.png)