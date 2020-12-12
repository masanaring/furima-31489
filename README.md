
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
- has_many :comments

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase item
- has_many :comments

## Purchase_items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| prefecture_id   | integer      | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| postal_code     | string       | null: false                    |
| phone_number    | string       | null: false                    |
| purchase_item   | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase item


## comments テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| text            | text         | null: false                    |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
