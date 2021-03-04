**個人制作アプリ marketforyou**
----------
来店予約や店頭スタッフとDMや写真投稿が可能の架空のアパレルサイト

|トップページ|ユーザー新規登録|
|---|---|
|![](https://user-images.githubusercontent.com/71421107/109909377-562dd300-7ce9-11eb-92a3-bebd33a27245.gif)|![](https://user-images.githubusercontent.com/71421107/109909981-79a54d80-7cea-11eb-92e0-c6c59d96b1bb.gif)|
|スタッフ新規登録|フォロー機能|
|![](https://user-images.githubusercontent.com/71421107/109910681-069cd680-7cec-11eb-9d26-09e0d0d5ec91.gif)|![](https://user-images.githubusercontent.com/71421107/109910924-7d39d400-7cec-11eb-9f81-a9be9f296951.gif)|  
|コメント・画像投稿機能|来店予約機能|
|![](https://user-images.githubusercontent.com/71421107/109911458-795a8180-7ced-11eb-9b63-b10d65a19d9f.gif)|![](https://user-images.githubusercontent.com/71421107/109912142-dacf2000-7cee-11eb-9153-fbebc676e4d5.gif)|

**アプリケーション開発の背景**
----------
**■前職での体験談を参考に構想しました。<br>**
&emsp;お客様の多くはお気に入りのスタッフがいて1対1で対話しながら買い物がしたいがコロナ禍で不要不急の外出は避けたい。<br>
またコーディネートが苦手な方向けにユーザーが持っている洋服を投稿してスタッフがアドバイスできるチャットルームを作りたいと思い開発しました。<br>

**実装完了した機能の一覧**
----------
**1）ユーザー新規登録機能(devise) <br>**
&emsp;ニックネーム、パスワード、メールアドレス、名前(全角)、名前カナ(全角)、電話番号の入力<br><br>
**2）ユーザーログイン機能(devise) <br>**
&emsp;パスワード、メールアドレスの入力<br><br>
**3）スタッフ新規登録機能(devise) <br>**
&emsp;ニックネーム、パスワード、メールアドレスの入力<br><br>
**4）ユーザーログイン機能(devise) <br>**
&emsp;パスワード、メールアドレスの入力<br><br>
**5）フォロー機能<br>**
&emsp;ユーザーはスタッフをフォロー、スタッフはユーザーをフォローする。相互フォロー時のみチャットが可能。1対1でのチャットルームを作る事でプライベートな会話が可能です。<br><br>
**6）コメント・画像投稿機能<br>**
&emsp;コメントと画像はそれぞれ個別に送信可能。<br><br>
**7）レスポンシブ機能 <br>**
&emsp;PCよりもスマホユーザーが圧倒的に多い、特にスマホのデザインに関しては年々重要視されているのでレスポンシブデザインにて構築することで、PC・スマホどちらのデバイスでもわかりやすく使いやすいサイトデザインに仕上げています。今回はCSSのメディアクエリというモジュールを使用して実装を行っています。<br><br>
**8）トップページスライド機能 <br>**
&emsp;slickスライダーを使用。時間の経過によりバナーがスライドされる。また矢印やボタンを押すことでもスライド可、たくさんの情報をコンパクトにすることができます<br><br>
**9）テストの実施（model) <br>**
&emsp;RSpec、factory_bot使用<br>

**開発日数**
----------
**作業期間 2020年12月25日 〜 2021年2月28日<br>**
のべ工数 66日/400時間 <br>

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
本番環境<br>
&emsp;webサーバー/Nginx 手動デプロイ<br>
使用Gem<br>
&emsp;pry-rails<br>
&emsp;rails-i18n<br>
&emsp;devise<br>
&emsp;rspec-rails<br>
&emsp;factory_bot_rails<br>
&emsp;faker<br>
&emsp;mini_magick<br>
&emsp;image_processing<br>
&emsp;rmagick<br>
&emsp;jquery-rails<br><br>

**DB設計**
----------
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

連絡先
----------
森 賢一 (モリケンイチ)
&emsp;Gmail / on88.mori.kenichi@gmail.com
