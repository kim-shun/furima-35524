# README

# アプリケーション名
## furima-35524

# URL
https://furima-35524.herokuapp.com/

# テスト用アカウント

## Basic認証
- ユーザー名： admin
- パスワード： 2222

## テストユーザー1
- email : aaaa@aaaa
- password : poki1poki

## テストユーザー2
- email : bbbb@bbbb
- password : poki1poki


# 基本機能
- ユーザー管理機能
- 商品出品機能
- 商品一覧表示機能
- 商品詳細表示機能
- 商品情報編集機能
- 商品削除機能
- 商品購入機能
- S3の導入

# 追加した実装
## プレビュー機能 & 複数枚画像投稿機能
- 商品出品時
[![Image from Gyazo](https://i.gyazo.com/c6eb4682da226d2fde80b59ba0fb60e2.gif)](https://gyazo.com/c6eb4682da226d2fde80b59ba0fb60e2)
- 商品詳細ページ
[![Image from Gyazo](https://i.gyazo.com/28c85b74d480440219d6bb557ee46382.gif)](https://gyazo.com/28c85b74d480440219d6bb557ee46382)
## コメント機能
[![Image from Gyazo](https://i.gyazo.com/021ebee4c256de2bc37383ff440f4c65.gif)](https://gyazo.com/021ebee4c256de2bc37383ff440f4c65)
## クレジットカード登録機能
- 登録画面に遷移
[![Image from Gyazo](https://i.gyazo.com/37d521f6409b13eaecd523f27edab1e8.gif)](https://gyazo.com/37d521f6409b13eaecd523f27edab1e8)
- 登録されたカードの表示
[![Image from Gyazo](https://i.gyazo.com/a15739a6e96c0df972574d1620572728.gif)](https://gyazo.com/a15739a6e96c0df972574d1620572728)
- 登録されたカードで購入
[![Image from Gyazo](https://i.gyazo.com/af6cd455bce5fe486592cc05b4559c12.gif)](https://gyazo.com/af6cd455bce5fe486592cc05b4559c12)
- カードを登録せずに購入
[![Image from Gyazo](https://i.gyazo.com/96a74b230e41ab49b514d548ae198265.gif)](https://gyazo.com/96a74b230e41ab49b514d548ae198265)
## パンくずリスト
[![Image from Gyazo](https://i.gyazo.com/f68a57584ccd6f7f14ee91b5b8acfee3.gif)](https://gyazo.com/f68a57584ccd6f7f14ee91b5b8acfee3)
## 複雑な検索機能 & ボタンの変色
[![Image from Gyazo](https://i.gyazo.com/4c5673e6d25e09251ec2663ab3b3f107.gif)](https://gyazo.com/4c5673e6d25e09251ec2663ab3b3f107)
## マイページ
[![Image from Gyazo](https://i.gyazo.com/e0fe409bab1d7bc7a42196b07465d43f.gif)](https://gyazo.com/e0fe409bab1d7bc7a42196b07465d43f)
## SNSアカウントでログイン
[![Image from Gyazo](https://i.gyazo.com/78638b3d35dfe78ae1021909f436913d.gif)](https://gyazo.com/78638b3d35dfe78ae1021909f436913d)
<br>
- AWSのサーバーの利用も追加済み

## 工夫したポイント
- アクティブユーザー以外でも抵抗なくアプリを利用できるように、クレジットカードを登録してもしなくても商品を購入できるように設定した。クレジットカードを登録してもしなくても商品を購入できるようにコントローラーやjavascriptで条件ごとに処理を変えられるようにした。下記のブログに詳細を書いている。
https://kim-shun.hatenablog.com/
- コメントにはコメントしたユーザー名が必要だと考え、ActionCableでユーザー名を扱えるように設定した。
- 機能を追加するごとにビューが崩れたり、テストコードの変更が必要になったり、芋づる方式で問題が発生したが、1つ１つ修正した。





# テーブル設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/8dc2e32c8a35547c31f984fcf6f23f8e.png)](https://gyazo.com/8dc2e32c8a35547c31f984fcf6f23f8e)

## users テーブル

| Column                | Type   | Options                   |
| --------              | ------ | -----------               |
| name                  | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_date            | data   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments
- has_one  :card

## items テーブル

| Column                 | Type       | Options                        |
| ------                 | ------     | -----------                    |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled-delivery_id  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :order
- has_many   :comments

## orders テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル
| Column      | Type       | Options           |
| ------      | ---------- | ----------------- |
| text        | text       |                   |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user

## cards テーブル
| Column         | Type       | Options           |
| ------         | ---------- | ----------------- |
| card_token     | string     | null: false       |
| customer_token | string     | null: false       |
| user           | references | foreign_key: true |

## Association
- belongs_to :user


# ローカルでの動作方法

- % git clone https://github.com/kim-shun/furima-35524.git  
- % cd morning-routine
- % bundle install
- % rails db:create
- % rails db:migrate
- % rails s
- → http://localhost:3000
