class Appointment < ApplicationRecord
  has_and_belongs_to_many :users

  validates :fixed_date, presence: true
  validates :description, presence: true

  validate :date_is_beyond_limit

  def date_is_beyond_limit
    return if fixed_date.nil?

    message = "should be at least 24 hours" unless fixed_date >= DateTime.now + 23.hours

    errors.add(:fixed_date, message) if message
  end
end
