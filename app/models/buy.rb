class Buy < ApplicationRecord
  belongs_to :user
  has_one    :good
  has_many   :buy_addresses
  has_many   :buy_credits
  accepts_nested_attributes_for :buy_addresses
  
  
  validates_associated :buy_addresses

end
