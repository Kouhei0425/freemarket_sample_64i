class Good < ApplicationRecord

  belongs_to :user
  belongs_to :brand
  belongs_to :area
  belongs_to :category
  has_many :images
  
end
