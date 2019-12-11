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
|name    | string  |null: false|
|size   | string   |null: false|
|price      |integer |null: false|
|method    |text |null: false|
|ship     |text  |null: false|
|explain  |text|null: false|
|user     |references  |null: false, foreign_key: true|
|brand     | references |null: false, foreign_key: true|
|area     | references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :area
- has_many :category, through: :category_goods, dependent: :destroy
- has_many :images, dependent: :destroy



## good_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category| references | null: false, foreign_key: true|
|good| references    | null: false, foreign_key: true|

### Association
- belongs_to :good
- belongs_to :category



## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name     |string   |
|parent | references | foreign_key: { to_table: :categories } |

### Association
- has_many :goods, through: :category_goods, dependent: :destroy
- belongs_to :parent, class_name: "Category", optional: true
- has_many :children, class_name: "Category", foreign_key: :parent_id



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| null: false |

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
|image | string | null: false |
|good| references | null: false, foreign_key: true |

### Association
- belongs_to :good



## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name |string|null: false |

### Association
- has_many :goods

## buyテーブル
|Column|Type|Options|
|------|----|-------|
|good-id |references  | null: false, unique: true|
|user |string | null: false|
|price |integer |null: false|
|Evaluation|integer |null: false|

### Association
- belongs_to :user
- belongs_to :good

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|

### Associaion
- has_many :message