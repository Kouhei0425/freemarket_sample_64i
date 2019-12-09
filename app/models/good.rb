class Good < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :area
  has_many :category_goods
  has_many :categories, through: :category_goods, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  def self.search(keyword)
    Good.where('name LIKE(?)', "%#{keyword}%")
  end

end
