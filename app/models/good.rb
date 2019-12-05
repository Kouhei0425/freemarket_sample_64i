class Good < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :area
  has_many :category, through: :category_goods
  has_many :images

end
