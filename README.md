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
| birthday           | date    | null: false               |

### Associations
- has_many :items
- has_many :orders
---

## items_table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| items_name        | string     | null: false                    |
| items_info        | text       | null: false                    |
| items_category_id | integer    | null: false                    |
| items_status_id   | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| ship_from_id      | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| items_price       | integer    | null: false                    | 
| user              | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_one :order
---

## orders_table

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| items    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Associations
- belongs_to :item
- belongs_to :user
- has_one :shipping_address
---

## shipping_address_table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Associations
- belongs_to :order