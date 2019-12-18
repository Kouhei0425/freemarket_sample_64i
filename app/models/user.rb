class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goods, dependent: :destroy
  has_many :buys
  has_many :credits
  has_one :address
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :credits
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :family_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  
end

