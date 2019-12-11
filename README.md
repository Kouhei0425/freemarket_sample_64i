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

## goodテーブル

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



## good_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category| references | null: false, foreign_key: true|
|good    | references | null: false, foreign_key: true|

### Association
- belongs_to :good
- belongs_to :category



## categoryテーブル
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



## areaテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| null: false |

### Association
- has_many :goods



## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image | string     | null: false |
|good  | references | null: false, foreign_key: true |

### Association
- belongs_to :good



### Userテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name             | string | null: false, unique: true |
|email                 | string | null: false, unique: true |
|family_name           | string | null: false |
|first_name            | string | null: false |
|family_kana           | string | null: false |
|first_kana            | string | null: false |
|birthday_year         | date   | null: false |
|birthday_month        | date   | null: false |
|birthday_date         | date   | null: false |
|phone number          | string | null: false, unique: true |
|encrypted_password    | string | null: false |
|reset_password_token  | string | null: false, unique: true |
|reset_password_sent_at| string | null: false |
|remember_created_at   | string | null: false |

### Association
- has_many :goods
- has_many :buys
- has_many :credits
- has_one  :house


### houseテーブル
|Column|Type|Options|
|------|----|-------|
|post      | string | null: false |
|prefecture| string | null: false |
|city      | string | null: false |
|address   | string | null: false, unique: true |
|buil      | string |

### Association
- has_one    :user


### creditテーブル
|Column|Type|Options|
|------|----|-------|
|number  | date   | null: false |
|type    | string | null: false |
|month    | date   | null: false |
|year    | date   | null: false |
|security| string | null: false |

### Association
- has_many    :users



## buyテーブル
|Column|Type|Options|
|------|----|-------|
|good_id   | references | null: false, unique: true, foreign_key: true |
|house_id  | references | null: false, foreign_key: true |
|credit_id | references | null: false, foreign_key: true |
|user_id   | references | null: false|
|price     | string     | null: false|
|Evaluation| integer    | null: false|

### Association
- belongs_to :user
- has_one    :good
- has_many   :houses
- has_many   :credits



## buy_creditテーブル
|Column|Type|Options|
|------|----|-------|
|number  | date   | null: false |
|type    | string | null: false |
|month   | date   | null: false |
|year    | date   | null: false |
|security| string | null: false |

### Association
- belongs_to :buy



### buy_houseテーブル
|Column|Type|Options|
|------|----|-------|
|post      | string | null: false |
|prefecture| string | null: false |
|city      | string | null: false |
|address   | string | null: false, unique: true |
|buil      | string |

### Association
- belongs_to  :user


