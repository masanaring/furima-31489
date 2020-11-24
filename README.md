
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| family_name          | string | null: false |
| first_name_furigana  | string | null: false |
| family_name_furigana | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :purchase items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| shipping charge | integer    | null: false                    |
| delivery area   | integer    | null: false                    |
| days to ship    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase items


## Purchase items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| phone number    | string       | null: false                    |
| addresses       | references   | null: false, foreign_key: true |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :addresses

## Addresses テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| prefecture      | integer      | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building name   | string       | null: false                    |
| postal code     | string       | null: false                    |
| phone number    | string       | null: false                    |
| purchase item   | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase items
