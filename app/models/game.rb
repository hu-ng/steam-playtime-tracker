class Game < ApplicationRecord
  belongs_to :metagame
  belongs_to :user

  validates :playtime, presence: true

  scope :get_all_for_user, -> (id) { where(user_id: id) }
end
