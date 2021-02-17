# テーブル設計

## users テーブル
| Column         | Type    | Options                 |
| -------------- | ------  | ----------------------  |
| user_id        | integer | NOT NULL                |
| seller_id      | integer | NOT NULL                |
| buyer_id       | integer | NOT NULL                |
| nickname       | string  | NOT NULL                |
| email          | string  | NOT NULL ,  Unique:true |
| password       | string  | NOT NULL                |
| lastname       | string  | NOT NULL                |
| firstname      | string  | NOT NULL                |
| lastname_kana  | string  | NOT NULL                |
| firstname_kana | string  | NOT NULL                |

### Association
- belongs_to :credit_cards
- belongs_to :addresses
- has_many :items
- has_many :purchase_rocords, through: items


## credit_cards テーブル
| Column          | Type     | Options  |
| --------------  | ------   | ---------|
| credit_card_id  | integer  | NOT NULL |
| user_id         | reference| NOT NULL |
| card_information| integer  | NOT NULL |
| deadline_month  | integer  | NOT NULL |
| deadline_year   | integer  | NOT NULL |
| security_code   | integer  | NOT NULL |

### Association
- belongs_to :users


## addresses テーブル
| Column          | Type     | Options  |
| --------------  | ------   | ---------|
| address_id      | integer  | NOT NULL |
| user_id         | reference| NOT NULL |
| post_code       | string   | NOT NULL |
| city            | string   | NOT NULL |
| address         | string   | NOT NULL |
| building_name   | string   |          |
| phone_number    | integer  | NOT NULL |

### Association
- belongs_to :users


## items テーブル
| Column          | Type     | Options  |
| --------------  | ------   | ---------|
| item_id         | integer  | NOT NULL |
| seller_id       | reference| NOT NULL |
| image           |          | NOT NULL | *ActiveStorageで実装
| item_name       | string   | NOT NULL |
| item_explain    | text     | NOT NULL |
| item_price      | integer  | NOT NULL |

### Association
- belongs_to :users
- has_one :purchase_rocords

## purchase_records テーブル
| Column          | Type     | Options  |
| --------------  | ------   | ---------|
| purchase_id     | integer  | NOT NULL |
| item_id         | reference| NOT NULL |
| seller_id       | reference| NOT NULL | 
| buyer_id        | reference| NOT NULL |

### Association
- belongs_to :users
- belongs_to :items