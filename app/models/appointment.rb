class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist, class_name: "User"
  has_many :prescriptions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :date_time, presence: true
end
