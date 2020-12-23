# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | integer    | null: false                    |
| state           | integer    | null: false                    |
| charge          | integer    | null: false                    |
| shipping_place  | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| item_price      | integer    | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :order

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## adresses テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item