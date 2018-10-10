class User < ApplicationRecord
  has_secure_password
  has_many :user_challenges
  has_many :likes
end
