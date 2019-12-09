class Category < ApplicationRecord
  has_many :category_goods
  has_many :goods, through: :category_goods, dependent: :destroy
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: :parent_id

  def self.search(keyword)
    category = Category.where('name LIKE(?)', "%#{keyword}%")

    categories = []
    category.each do |ca|
      categories << ca
    end
    return categories

  end

end
