class Category < ApplicationRecord
  has_many :goods, through: :category_goods
  has_many :children, through: :children
  belongs_to :parent, class_name: "Category"
end
