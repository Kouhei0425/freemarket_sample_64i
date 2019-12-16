class CategoryGood < ApplicationRecord
    belongs_to :good
    belongs_to :category
end
