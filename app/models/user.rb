class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :appointments, optional: true
  VALID_GENDERS = ["male", "female"]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  validates :gender, inclusion: { in: VALID_GENDERS }

  scope :doctors, -> { where(role: "doctor") }
  scope :patients, -> { where(role: "patient") }
  
  def full_name
    "#{first_name} #{last_name}"
  end 

  def active_appointments
    appointments.where("fixed_date > ? ", DateTime.now)
  end

  def inactive_appointments
    appointments.where("fixed_date < ? ", DateTime.now)
  end
end
