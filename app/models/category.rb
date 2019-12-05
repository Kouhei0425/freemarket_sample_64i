class Category < ApplicationRecord
  has_many :goods, through: :category_goods
  has_many :children, trough: :category_goods
  belongs_to :parent, class_name: "Category"
end
