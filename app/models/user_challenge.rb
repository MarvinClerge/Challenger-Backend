class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :user, presence: true
  validates :challenge, presence: true
end
