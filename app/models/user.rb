class User < ApplicationRecord
  has_secure_password
  has_many :user_challenges

  validates :name, presence: true, uniqueness: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true
end
