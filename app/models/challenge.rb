class Challenge < ApplicationRecord
  has_many :user_challenges
  has_many :likes
end
