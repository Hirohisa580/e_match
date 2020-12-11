# イーマッチER図

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
- has_one :profile
- has_many :messages
- has_many :boards
- has_many :comments



--- 
## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|age|integer|       |
|birthday|date| ※date_select使用|
|area_id|integer|null: false ※ActiveHash使用|
|genre_id|integer|null: false ※ActiveHash使用|
|history|string|    |
|public_relation|text|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :dm



---
## dmsテーブル

|Column|Type|Options|
|------|----|-------|
|profile|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :messages



---
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|test|null: false|
|user|references|null: false, foreign_key: true|
|dm|references|null: false, foreign_key: true|

### Association
* belongs_to :user
* belongs_to :dm



---
## boardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|genre_id|integer|null: false ※ActiveHash使用|
|explanation|text|  |
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments



---
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|test|null: false|
|user|references|null: false, foreign_key: true|
|board|references|null: false, foreign_key: true|

### Association
* belongs_to :user
* belongs_to :board

---


## アプリケーション名
# E-match(仮)

## アプリケーション概要
* ユーザー登録
* プロフィール作成
* プロフィールの編集・削除
* 他人のプロフィールの閲覧
* 個人間でのやり取りができるDM機能

## URL https://e-match580.herokuapp.com/

テスト用アカウント	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
利用方法	このアプリケーションの利用方法を説明しましょう。
目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
データベース設計	ER図等を添付しましょう。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。