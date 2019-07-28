class User < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :steamid, presence: true
end
