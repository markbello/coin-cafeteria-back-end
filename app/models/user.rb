class User < ApplicationRecord
  has_secure_password
  has_many :user_coins
  has_many :coins, through: :user_coins
  validates :username, uniqueness: true
end
