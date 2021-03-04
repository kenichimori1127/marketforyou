**個人制作アプリ marketforyou**
----------
来店予約や店頭スタッフとDMや写真投稿が可能の架空のアパレルサイト

|トップページ|ユーザー新規登録|スタッフ新規登録|フォロー機能|
|---|---|---|---|
|![](https://user-images.githubusercontent.com/71421107/109907085-f7665a80-7ce4-11eb-9af1-fcf42eae2d03.gif)|![](https://user-images.githubusercontent.com/71421107/109907136-1369fc00-7ce5-11eb-81a8-f41d42a4582a.gif)|![](https://user-images.githubusercontent.com/71421107/109907231-40b6aa00-7ce5-11eb-9db7-32cd225bdecf.gif)|![](https://user-images.githubusercontent.com/71421107/109907340-66dc4a00-7ce5-11eb-90aa-2919c9e9f2b6.gif)|  
|コメント・画像投稿機能|来店予約機能|
|![](https://user-images.githubusercontent.com/71421107/109907366-79ef1a00-7ce5-11eb-899a-9aaa8447e878.gif)|![](https://user-images.githubusercontent.com/71421107/109902556-f67dfa80-7cdd-11eb-9ee9-793cbd43337a.mp4)|



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
**1）ユーザー新規登録機能(devise) <br>**
**2）ユーザーログイン機能(devise) <br>**
**3）スタッフ新規登録機能(devise) <br>**
**4）ユーザーログイン機能(devise) <br>**
**5）フォロー機能<br>**
&emsp;ユーザーはコメントの登録、削除のみ可能<br>
**8）コメント・画像投稿機能<br>**
**9）スマホレスポンシブ機能  <br>**
&emsp;&emsp;非Bootstrap、スクラッチ <br>
**10）テストの実施（model)<br>**
&emsp;&emsp;RSpec、factory_bot使用<br>

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
森 賢一 (モリケンイチ)
&emsp;Gmail / on88.mori.kenichi@gmail.com





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
