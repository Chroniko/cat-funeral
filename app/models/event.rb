class Event < ApplicationRecord
  validates :starts_at, presence: true
  validate :unavailable_timeframe

  def unavailable_timeframe
    if overlaps?
      errors.add(:starts_at, "can't be within 2h of another event")
    end
  end

  def overlaps?
    Event.pluck(:starts_at).map do |t|
      if starts_at.nil?
        true
      else
        starts_at.between?(t, t + 2.hours)
      end
    end.any?
  end

  def self.starting_on_date(day)
    Event.where("DATE(starts_at) = ?", day.to_date)
  end
end
