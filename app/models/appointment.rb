class Appointment < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  belongs_to :therapist, class_name: "User", foreign_key: :therapists_id
  has_many :prescriptions#, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :date_time, presence: true
end
