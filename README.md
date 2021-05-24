# README

# テーブル設計

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
