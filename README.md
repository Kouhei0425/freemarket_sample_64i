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
|string    |name   |null: false|
|string    |size   |null: false|
|integer   |price  |null: false|
|text      |method |null: false|
|text      |ship   |null: false|
|text      |explain|null: false|
|references|user   |null: false, foreign_key: true|
|references|brand  |null: false, foreign_key: true|
|references|area   |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :area
- has_many :category, through: :category_goods
- has_many :images



## good_categoryテーブル
|Column|Type|Options|
|------|----|-------|
references|category | null: false, foreign_key: true|
references|good     | null: false, foreign_key: true|

### Association
- belongs_to :good
- belongs_to :category



## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|string     |name   |
|references |parent | foreign_key: { to_table: :categories } |

### Association
- has_many :goods, through: :category_goods
- belongs_to :parent, class_name: "Category", optional: true
- has_many :children, class_name: "Category", foreign_key: :parent_id



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|string|name| null: false |

### Association
- has_many :goods



## areaテーブル
|Column|Type|Options|
|------|----|-------|
|string|name| null: false |

### Association
- has_many :goods



## imageテーブル
|Column|Type|Options|
|------|----|-------|
|string    | image | null: false |
|references| good  | null: false, foreign_key: true |

### Association
- belongs_to :good 