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
| first_name/kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one  :order

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| state           | string     | null: false                    |
| charge          | string     | null: false                    |
| shipping_place  | string     | null: false                    |
| shipping_days   | date       | null: false                    |
| item_price      | integer    | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :comments
- has_one  :order

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## orders テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| tel             | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items