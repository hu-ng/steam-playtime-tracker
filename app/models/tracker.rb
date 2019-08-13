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

  def self.check_status_trackers
    Tracker.all.each do |tracker|
      if tracker.until < Time.now
        TrackerMailer.expired_mail(tracker).deliver_now
        tracker.destroy
        p "Tracker expired"
      end
    end
  end

  def self.update_tracker game
    tracker = game.tracker
    tracker.playtime = game.playtime - tracker.base_playtime
    tracker.save
    if tracker.playtime > tracker.threshold
      TrackerMailer.alert_email(tracker).deliver_now
    end
  end

end
