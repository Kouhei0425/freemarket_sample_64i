class CategoryGood < ApplicationRecord
    belongs_to :good, optional: true
    belongs_to :category, optional: true
end
