class Tracker < ApplicationRecord
  belongs_to :game

  validates :threshold, presence: true
  validates :base_playtime, presence: true
  validate :validate_days_weeks_months

  def validate_days_weeks_months
    errors.add(:days) if days.blank? && weeks.blank? && months.blank?
  end

  def until
    self.created_at = self.created_at + self.days.days if self.days.present?
    self.created_at = self.created_at + self.weeks.weeks if self.weeks.present?
    self.created_at = self.created_at + self.months.months if self.months.present?
    self.created_at.strftime("%Y-%m-%d")
  end
end
