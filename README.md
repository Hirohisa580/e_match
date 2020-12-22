

## アプリ概要
* ユーザー登録（新規登録、ログイン、ログアウト）
* プロフィール作成（作成、編集、削除）
* スケジュール管理（作成、編集、削除）
* 他人のプロフィールを表示する（いいね機能あり）
* DM機能（DM部屋開設、メッセージ機能）
* 掲示板作成（作成、編集、削除）
* 掲示板一覧表示（詳細表示、コメント機能）
* ジャンル別検索機能

---
## ペルソナ
* 俳優、ミュージシャン、ダンサー、お笑い、最近ではyoutuber、配信者なども含め、エンタメ業界に生きる人に向けて
* 年齢男女問わず

---

## 本番環境
* デプロイ：AWS（EC2、unicorn、nginx）
* 画像保存：AWS（S3）
* テストアカウント１：メールアドレス【】、パスワード【q12345】
* テストアカウント２：メールアドレス【】、パスワード【q12345】
* Basic認証：ユーザー名【admin】、パスワード【2222】

---

## 目指した課題解決

新たな出会いやチャンスの場や挑戦の場を中々見付けられないでいる人たちに新しい可能性。そして、もっと手軽に共演、切磋琢磨できる仲間を見付けられる場を提供したい。そういう思いからこのアプリを開発しました。
私自身が現役時代に『もっと手軽に、自分の求めている人を探しだして交流できる場があれば良いな。』という思いがありました。
例えば『自分と同レベル以上に熱量がある』『見た目やお芝居の特徴などが自分が関わる作品にマッチしているか』『目指しているもの、今やりたいことがマッチしているか』などです。今までは基本的に自分の横のつながりだけが出会いの基本でしたが、そういったエンタメの交流やアピールが専門のSNSがあればこの課題は一気に解決するのではないかと考えました。

---

## DEMOを載せる予定


---

## 工夫したポイント

現存するSNSでは、利用者の範囲が広すぎるため逆にこういった専門的な利用には使いづらい部分がありました。また匿名性も高いため、その人物の正体をネット上でなかなか見極められません。一見親しげな様でただ自分のビジネスを売りたいだけの人なんかも大変多く見かけます。
しかし、今回開発したアプリは『実際に利用している芸名』『本人の顔が分かる写真（宣材写真）』『活動地域』『活動ジャンル』を必ず記載してもらう様にしており、さらに芸歴や過去の経歴などを記載する欄も用意しており、そちらの記載も基本としているため匿名性は低いです。
ユーザーはそういったより専門的な情報を元に自分のやりたい事、交流したい人と合致した相手をピンポイントに探すことができます。
さらに今回、敢えてフォロー機能を無くしておりますが、その理由が２点ございます。

1. 一期一会を大切にしたいため
2. 気軽にメッセージを送りやすくするため。

1、トップページではユーザーのプロフィール情報が一覧となって表示されるのですが、それを基本ランダム表示にしてあります。毎回更新する度に表示されるユーザーが変化するため、常に新鮮な気持ちで交流相手を探すことができます。『取り敢えずフォローだけしとこう』が出来てしまうと、それだけで結局交流が起こらず『フォローしてから結構経つし今更..』という思いが芽生えてしまいます。
そういった消極的な結末を避けるためにフォロー機能を排除しました。

2、Twitterなどが顕著なのですが、『メッセージやリプは基本相互フォロー内で』というちょっとした暗黙の了解の様な風潮があります。
しかし、最初からフォロー機能が存在しなければそんな暗黙の了解は関係なく気軽にメッセージを送ることができます。
また、メッセージをすると結果的にその人と繋がるので疑似的なフォローにもなります。

---
## 使用技術(開発環境)
* ローカル環境
* HTML &CSS（一部Bootstrap、FontAwesomeを利用）
* Ruby 2.6.5
* Ruby on Rails 6.0.0
* JavaScrupt（Ajaxを利用した部分もあります）
* AWS（EC2、S3）
* Rspec（モデル単体テストコード、結合テストコード）

---

## 課題や今後実装したい機能
* より匿名性を下げるための本人確認機能
* ビューの最適化（特にプロフィールを見やすくしたい）
* 動画を載せられる機能
* N+1問題を考慮したリファクタリング
* 位置情報を利用した検索機能

---
---
# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|first_name_ruby|string|null: false|
|last_name|string|null: false|
|last_name_ruby|string|null: false|
|phone_number|string|null: false|

### Association
- has_one  :profile
- has_many :messages
- has_many :user_dms
- has_many :dms, through: :user_dms
- has_many :boards
- has_many :comments
- has_many :schedules
- has_many :favorites
 


--- 
## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|age|integer|       |
|birthday|date|     |
|area_id|integer|null: false|
|genre_one_id|integer|null: false|
|genre_two_id|integer|null: false|
|genre_three_id|integer|null: false|
|history|string|    |
|public_relation|text|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :messages
- has_many :boards, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :schedules, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_one_attached :image



---
## dmsテーブル

|Column|Type|Options|
|------|----|-------|
|profile|references|null: false, foreign_key: true|

### Association
-  has_many :messages
-  has_many :user_dms
-  has_many :users, through: :user_dms



---
## user_dmsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|dm|references|foreign_key: true|

### Association
-  belongs_to :user
-  belongs_to :dm



---
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|test|null: false|
|user|references|foreign_key: true|
|profile|references|foreign_key: true|
|dm|references|foreign_key: true|

### Association
-  belongs_to :user
-  belongs_to :profile
-  belongs_to :dm



---
## boardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|genre_one_id|integer|null: false|
|explanation|text|null: false|
|profile|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
-  belongs_to :profile
-  belongs_to :user
-  has_many :comments, dependent: :destroy



---
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|test|null: false|
|profile|references|foreign_key: true|
|board|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
-  belongs_to :profile
-  belongs_to :board
-  belongs_to :user



---
## schedulesテーブル

|Column|Type|Options|
|------|----|-------|
|title |string|null: false|
|plan|text  |         |
|start_time|datetime| |
|user|references|foreign_key: true|
|profile|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :profile



---
## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|profile|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :profile



---



