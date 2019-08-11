class Game < ApplicationRecord
  include SessionsHelper

  belongs_to :metagame
  belongs_to :user
  has_one :tracker

  validates :playtime, presence: true

  scope :get_all_for_user, -> (id) { where(user_id: id) }
end
