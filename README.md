# テーブル設計

## users テーブル
| Column            | Type      | Options                    |
| --------------    | ------    | ----------------------     |
| nickname          | string    | null: false                |
| email             | string    | null: false ,  Unique:true |
| encrypted_password| reference | null: false                |
| lastname          | string    | null: false                |
| firstname         | string    | null: false                |
| lastname_kana     | string    | null: false                |
| firstname_kana    | string    | null: false                |
| year              | integer   | null: false                |
| month             | integer   | null: false                |
| day               | integer   | null: false                |
### Association
- has_one :address
- has_many :items
- has_many :purchase_records

## addresses テーブル
| Column          | Type     | Options     |
| --------------  | ------   | ---------   |
| purchase_record | reference| null: false |
| post_code       | string   | null: false |
| city            | string   | null: false |
| address         | string   | null: false |
| building_name   | string   |             |
| phone_number    | string   | null: false |
### Association
- belongs_to :user
- belongs_to :purchase_record

## items テーブル
| Column             | Type     | Options     |
| --------------     | ------   | ---------   |
| user               | reference| null: false |
| name               | string   | null: false |
| explain            | text     | null: false |
| category           | integer  | null: false |
| status             | integer  | null: false |
| method_of_payment  | integer  | null: false |
| area               | integer  | null: false |
| days_required      | integer  | null: false |
| price              | integer  | null: false |
### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル
| Column  | Type     | Options    |
| ------- | ------   | ---------  |
| user    | reference| null: false|
| item    | reference| null: false|
### Association
- belongs_to :user
- belongs_to :item
- has_many :addresses