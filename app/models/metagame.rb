class Metagame < ApplicationRecord
  has_many :games, dependent: :destroy
  
  validates :name, presence: true
  validates :appid, presence: true
end
