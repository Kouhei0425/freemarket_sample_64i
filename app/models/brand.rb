class Brand < ApplicationRecord
  has_many  :goods

  def self.search(keyword)

    
    brands = Brand.where('name LIKE(?)', "%#{keyword}%")
    brand = []
    brands.each do |br|
      brand << br
    end

    return brand

  end
end
