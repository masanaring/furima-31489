
# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| furigana      | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :purchase items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping charge | string     | null: false                    |
| delivery area   | string     | null: false                    |
| days to ship    | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase items


## Purchase items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| card            | string       | null: false                    |
| expiration date | string       | null: false                    |
| security code   | string       | null: false                    |
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
| prefecture      | string       | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building name   | string       | null: false                    |
| postal code     | string       | null: false                    |
| phone number    | string       | null: false                    |
| purchase item   | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase items
