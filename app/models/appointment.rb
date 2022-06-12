class Appointment < ApplicationRecord
  has_and_belongs_to_many :users

  validates :fixed_date, presence: true
end
