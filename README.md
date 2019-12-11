# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|name    | string     |null: false|
|size    | string     |null: false|
|price   | integer    |null: false|
|method  | text       |null: false|
|ship    | text       |null: false|
|explain | text       |null: false|
|user    | references |null: false, foreign_key: true|
|brand   | references |null: false, foreign_key: true|
|area    | references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :area
- has_many :category, through: :category_goods, dependent: :destroy
- has_many :images, dependent: :destroy
- has_one  :buy



## category_goodsテーブル
|Column|Type|Options|
|------|----|-------|
|category| references | null: false, foreign_key: true|
|good    | references | null: false, foreign_key: true|

### Association
- belongs_to :good
- belongs_to :category



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name   | string     |
|parent | references | foreign_key: { to_table: :categories } |

### Association
- has_many :goods, through: :category_goods, dependent: :destroy
- belongs_to :parent, class_name: "Category", optional: true
- has_many :children, class_name: "Category", foreign_key: :parent_id



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name  |string| null: false |

### Association
- has_many :goods



## areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| null: false |

### Association
- has_many :goods



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image | string     | null: false |
|good  | references | null: false, foreign_key: true |

### Association
- belongs_to :good



### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name             | string   | null: false, unique: true |
|email                 | string   | null: false, unique: true |
|family_name           | string   | null: false |
|first_name            | string   | null: false |
|family_kana           | string   | null: false |
|first_kana            | string   | null: false |
|birthday_year         | date     | null: false |
|birthday_month        | date     | null: false |
|birthday_date         | date     | null: false |
|phone number          | string   | null: false, unique: true |
|encrypted_password    | string   | null: false |
|reset_password_token  | string   | null: false, unique: true |
|reset_password_sent_at| datetime | null: false |
|remember_created_at   | string   | null: false |


### Association
- has_many :goods
- has_many :buys
- has_many :credits
- has_many :addresses


### addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post       | string | null: false |
|prefecture | string | null: false |
|city       | string | null: false |
|address    | string | null: false |
|buil       | string |
|user_id    | references | null: false,foreign_key: true |

### Association
- belongs_to    :user


### creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number  | date   | null: false |
|type    | string | null: false |
|month   | date   | null: false |
|year    | date   | null: false |
|security| string | null: false |
|user_id    | references | null: false,foreign_key: true |


### Association
- belong_to   :user



## buysテーブル
|Column|Type|Options|
|------|----|-------|
|good_id   | references | null: false, unique: true, foreign_key: true |
|user_id   | references | null: false,foreign_key: true|
|price     | integer    | null: false|
|evaluation| integer    | null: false|

### Association
- belongs_to :user
- has_one    :good
- has_many   :buy_address
- has_many   :buy_credit



## buy_creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number  | date   | null: false |
|buy_id  | references | null: false, foreign_key: true|
|type    | string | null: false |
|month   | date   | null: false |
|year    | date   | null: false |
|security| string | null: false |

### Association
- belongs_to :buy



### buy_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post      | string | null: false |
|prefecture| string | null: false |
|city      | string | null: false |
|address   | string | null: false |
|buil      | string |
|buy_id  | references | null: false, foreign_key: true|

### Association
- belongs_to  :buy



