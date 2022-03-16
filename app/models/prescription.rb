class Prescription < ApplicationRecord
  belongs_to :appointment
  has_one_attached :document
end
