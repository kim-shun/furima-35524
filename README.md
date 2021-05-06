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

## orders テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## prefectures テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | text       | null: false                    |
| building      | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one :order