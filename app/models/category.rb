class Category < ApplicationRecord
  belongs_to :good
  has_one :parent, class_name: "Category"
  has_many :children, class_name: "Category"
end
