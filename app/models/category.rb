class Category < ApplicationRecord
  has_many :goods
  belongs_to :parent, class_name: "Category"
  has_many :children
end
