class Buy < ApplicationRecord
  belongs_to :user
  has_one    :good
  has_one   :buy_address
  has_one   :buy_credit
  accepts_nested_attributes_for :buy_address
  accepts_nested_attributes_for :buy_credit

end
