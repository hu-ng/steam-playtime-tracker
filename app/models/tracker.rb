class Tracker < ApplicationRecord
  belongs_to :game

  validates :threshold, presence: true
  validates :base_playtime, presence: true
  validate :validate_days_weeks_months

  def validate_days_weeks_months
    errors.add(:days) if days.blank? && weeks.blank? && months.blank?
  end
end
