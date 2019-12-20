class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goods, dependent: :destroy
  has_many :buys
  has_many :credits
  has_one :address
  has_many :sns_credentials, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :credits
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  validates :family_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  
  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    if user
      #SNSを使って登録したユーザーがいたらそのユーザーを返す
      return user
    else
      #いなかった場合はnewします。
      new_user = User.new(
        email: auth.info.email,
        nickname: auth.info.name,
        uid: auth.uid,
        provider: auth.provider,
        #パスワードにnull制約があるためFakerで適当に作ったものを突っ込んでいます
        password: Faker::Internet.password(min_length: 8,max_length: 128)
      )
      return new_user
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
end

