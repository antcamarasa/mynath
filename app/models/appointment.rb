class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist, class_name: "User"
  has_many :prescriptions, dependant: :destroy
  has_many :feedbacks, dependant: :destroy

  validates :date_time, presence: true
end
