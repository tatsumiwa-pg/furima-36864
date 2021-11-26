# README


## users_table

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| user_birth_date_y  | date    | null: false               |

### Associations
has_many :items
has_many :orders

## items_table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| items_name     | string     | null: false                    |
| items_info     | text       | null: false                    |
| items_category | integer    | null: false                    |
| items_status   | integer    | null: false                    |
| shipping_fee   | integer    | null: false                    |
| ship_from      | integer    | null: false                    |
| shipping_date  | integer    | null: false                    |
| items_price    | integer    | null: false                    |
| add_tax        | integer    | null: false                    |
| profit         | integer    | null: false                    |
| seller_user_id | references | null: false, foreign_key: true |
| trade_status   | integer    | null: false                    |

### Associations
belongs_to :user
has_one :order


## orders_table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| postal_code         | string     | null: false                    |
| prefecture          | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| items_id            | references | null: false, foreign_key: true |
| buyer_user_id       | references | null: false, foreign_key: true |
| seller_user_id      | references | null: false, foreign_key: true |

### Associations
belongs_to :item
belongs_to :user