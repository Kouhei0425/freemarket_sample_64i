class Buy < ApplicationRecord
  belongs_to :user
  has_one    :good
  has_many   :buy_address
  has_many   :buy_credit
end
