# アプリケーション名
Staffing App

# アプリケーション概要
人員と配置箇所をそれぞれ登録することができ、人員配置表を作成することができる。

# URL
https://staffing-app.onrender.com/start_days

# 利用方法
### 日付の選択
・2週間分の人員配置表を作成するため、登録開始日を選択する

#### 配置表の作成
・トップページでは2週間分の人員配置表が表示される  
・トップページから配置表登録画面に遷移できる  
・配置表登録画面のマス内にプルダウンで配置箇所が表示され選択できる  
・各メンバーの2週間分の配置箇所を選択し登録することができる  
・1週間に4回以上同じ配置箇所に配置されている場合はメッセージで表示される  
・2週連続同じ曜日で同じ配置箇所に配置されている場合はメッセージで表示される  
・登録ボタンを押すと配置表が登録されトップページにもどる  
・削除ボタンから配置表の内容を削除することができる  
・人員登録画面に遷移できる
・配置箇所登録画面に遷移できる

#### 人員の登録
・人員登録画面から人員の登録ができる  
・登録されている人員の削除ができる

#### ポジションの登録
・配置箇所登録画面から配置箇所の登録ができる  
・登録されている配置箇所の削除ができる




# アプリケーション開発の背景
現職において基本業務の傍ら助手スタッフ人員の配置表を作成しなければならない状況で、その手間を少しでも省きたいというところから開発の発想を得た。  
助手スタッフは不定期の休日があったり、同じ配置が連続することや頻度が多いことに対し不満があるなど、それらの点を考慮しながら配置表を作成することが非常に手間だった。  
その作業をアプリケーションで行うことができるようにすることで、効率よく配置表を作成し本来の業務に支障をきたさないようにできればと考えている。

# 洗い出した要件
要件定義書  
https://docs.google.com/spreadsheets/d/1-QHp62l2QdWaF8Uysh_p6oOsMWs4_2_mlurGcAEctow/edit#gid=982722306

# 実装予定の機能
プルダウンに登録した内容が表示された状態で編集できる機能を実装していきたい。
また、現時点ではプルダウンから配置箇所を手入力する必要があるため、自動でランダム入力できるような機能を追加していきたいと考えている。

# データベース設計
![staffing](https://user-images.githubusercontent.com/115336998/232180721-6bb591f7-1ecd-46fa-a682-46f20168a72e.png)


# 画面遷移図
![staffing](https://user-images.githubusercontent.com/115336998/232180580-4de30843-db42-4b78-9935-aee8e5ae18fd.png)


# 開発環境
HTML/CSS/Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/kmt0224/staffing_app.git
% cd staffing_app
% bundle install
% yarn install 

# 工夫したポイント
プルダウンから登録させる際に、一つずつ登録ボタンを押すのは煩わしいと考え、全てのプルダウンを選択した上で一括登録ができるように工夫しました。

