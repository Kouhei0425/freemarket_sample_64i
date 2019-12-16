class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goods, dependent: :destroy
  has_many :buys
  has_many :credits
  has_many :addresses
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :credits
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
