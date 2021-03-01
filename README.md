**個人制作アプリ marketforyou**
----------
来店予約や店頭スタッフとDMや写真投稿が可能の架空のアパレルサイト

|root|かんたんログイン|カフェ一覧|カフェ詳細|
|---|---|---|---|
|![](toppage.png)|![](https://user-images.githubusercontent.com/60636597/82975362-2bef0c80-a017-11ea-84f1-188202c066eb.PNG)|![](https://user-images.githubusercontent.com/60636597/82975390-4628ea80-a017-11ea-86f5-dabf1d11f84e.PNG)|![](https://user-images.githubusercontent.com/60636597/82975443-66f14000-a017-11ea-84fa-caddfd97815b.PNG)|  
|カフェ紹詳細|カフェサイト遷移|ナビURLスキーム|
|![](https://user-images.githubusercontent.com/60636597/82976519-42e32e00-a01a-11ea-99a4-16082d065a38.PNG)|![](https://user-images.githubusercontent.com/60636597/82976951-6bb7f300-a01b-11ea-95ed-8dea15efef2f.PNG)|![](https://user-images.githubusercontent.com/60636597/82977033-9d30be80-a01b-11ea-8683-0223d23f1531.PNG)|  


**アプリケーション開発の背景**
----------
**■前職での体験談を参考に構想しました。<br>**
&emsp;お気に入りのスタッフさんがいて対話しながら買い物がしたいがコロナ禍で不要不急の外出は避けたい。<br>
またコーディネートが苦手な方向けにユーザーが持っている洋服を投稿して<br>
スタッフがアドバイスできるチャットルームを作りたいと思い開発しました。<br>

**このアプリで得られる体験**
----------
●ノマドワークに適したFreeWifi+Free電源のカフェをGoogleMap、テキストや画像で表示します<br>
●アプリを開いてすぐに、どんなカフェがあるか具体的な写真で見せて、現在地から行きたいお店まで経路をナビします <br> 
●ユーザーにコメント機能で口コミを共有できます<br>
●お問い合わせフォームで、ユーザー側からの掲載情報更新の要請などに応えます<br>

**実装を完了した機能の一覧**
----------
**１）デモデータの充実(起動時にdb:seef.fuコマンドでモデルに事前投入）<br>**
&emsp;&emsp;デモデータ:19件、 デモ画像:95枚<br>
**２）GoogleMaps地図表示、現在地取得　(Google Cloud Platformサービス maps javascriput API使用) <br>**
&emsp;&emsp;２種類の地図表示　（お店一覧ページで全店舗の吹き出し表示、お店詳細ページでそのお店だけの吹き出し表示）<br>
**３）ナビ機能　googlemap URLスキーム（外部依存）利用 <br>**
&emsp;&emsp;お店一覧ページで全店舗の吹き出し表示のリンク、お店詳細ページでナビボタン押下で起動 <br>
&emsp;&emsp;→本家がアプリ起動し同時にナビ開始<br>
**４）サインイン機能(devise) <br>**
&emsp;&emsp;手軽に使ってもらうため、ニックネーム、パスワードのみにカスタム <br>
**５）簡単ログインボタン <br>**
&emsp;&emsp;管理者やユーザーとして、簡単にテストログインできる  <br>
**６）CRUD機能（管理者のみ登録編集削除可） <br>**
&emsp;&emsp;管理者はお店情報、画像、コメントを登録、編集、削除可能 <br>
**7）コメント（口コミ）投稿削除機能<br>**
&emsp;&emsp;ユーザーはコメントの登録、削除のみ可能<br>
**8）画像アップロード機能（carrierwave）<br>**
**9）スマホレスポンシブ機能  <br>**
&emsp;&emsp;非Bootstrap、スクラッチ <br>
**10）おすすめ度・星評価（レートDB取得css表示）  <br>**
**11）お問合せフォーム機能（入力/確認/お礼/自動Gmail送信機能）<br>**
&emsp;&emsp;サインインアウト状態問わず、お問い合わせフォームに遷移でき、メッセージ送信で自動でgmailが管理者に届く <br>
**12)Docker、docker-composeローカル開発<br>**
&emsp;&emsp;ローカル環境にてDocker実装、Dockerfile、Docker-composeにてイメージ、コンテナを管理<br>
**13）テストの実施（model)<br>**
&emsp;&emsp;RSpec、factory_bot使用<br>

〜以下、CircleCI自動デプロイ作業=nomadcafe-subリポジトリ〜<br>
https://github.com/Sakagami-Keisuke/nomadcafe-sub<br>
**15）独自ドメイン取得、AWS Route53DNS、Let’s Encryptで無料SSL証明書取得、HTTPS接続設定**<br>
**16）スマートフォン実機でのアプリ動作、マップ表示、現在地取得、ナビURLスキーム検証、CSS調整**<br>
**17）CI/CD CircleCI masterpush自動デプロイ化（学習作業中）**<br><br>
**18）課題：EC2インスタンスコスト縮減　定時自動起動停止(Lambda とCloudWatch)** <br>
 
**開発日数**
----------
**作業期間 2020年12月25日 〜 2021年2月28日<br>**
のべ工数 61日/426時間 <br>

**使用言語技術**
--------------
言語・フレームワーク<br>
&emsp;Ruby2.5.1/Rails2.5.1<br>
フロント<br>
&emsp;html/css/Javascript<br>
データベース<br>
&emsp;MySQL5.6<br>
テスト<br>
&emsp;RSpec/factory_bot<br>
インフラ<br>
&emsp;AWS EC2 Linux2AMI t3small<br>
ドメイン・DNS<br>
&emsp;お名前ドットコム/AWS Route53<br>
本番環境<br>
&emsp;webサーバー/Nginx 手動デプロイ<br>
使用Gem<br>
pry-rails<br>
rails-i18n<br>
devise<br>
rspec-rails<br>
factory_bot_rails<br>
faker<br>
mini_magick<br>
image_processing<br>
rmagick<br>
jquery-rails<br><br>

連絡先
----------
坂上計介 サカガミケイスケ
&emsp;&emsp;Gmail / iwayasunset@gmail.com &emsp;&emsp;twitter / https://twitter.com/slope_top_kei





## usersテーブル
| Column             | Type         | Options                              |
| ------------------ | ------------ | ------------------------------------ |
| nickname           | string       | null: false                          |
| encrypted_password | string       | null: false                          |
| email              | string       | null: false unique: true, index:true | 
| first_name         | string       | null: false                          |
| family_name        | string       | null: false                          |
| first_name_kana    | string       | null: false                          |
| family_name_kana   | string       | null: false                          |
| phone_number       | string       | null: false, foreign_key: true       |
| staff_flag         | boolean      |                                      |

### Association
  has_many :messages
  has_many :entries
- has_many :reservations

## staffsテーブル
| Column             | Type         | Options                              |
| ------------------ | ------------ | ------------------------------------ |
| nickname           | string       | null: false                          |
| encrypted_password | string       | null: false                          |
| email              | string       | null: false unique: true, index:true |

### Association
  has_many :messages
  has_many :entries

## relationshipsテーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user             | references   | null: false, foreign_key: true |
| staff            | references   | null: false, foreign_key: true |
| user_type        | boolean      |                                |


## roomsテーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| name             | string       |                                |

### Association
  has_many :messages
  has_many :entries

## entriesテーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      |                                |
| staff_id         | integer      |                                |
| room             | references   | null: false, foreign_key: true |

### Association
  belongs_to :room

## messagesテーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user             | references   | null: false, foreign_key: true |
| staff            | references   | null: false, foreign_key: true |
| room             | references   | null: false, foreign_key: true |
| content          | text         |                                |

## reservationsテーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      |                                |
| date             | text         |                                |
| time             | text         |                                |
