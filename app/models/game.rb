class Game < ApplicationRecord
  belongs_to :metagame
  belongs_to :user

  validates :playtime, presence: true
end
