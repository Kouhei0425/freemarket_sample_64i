class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goods, dependent: :destroy
  has_many :buys
  has_many :credits
  has_many :addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
