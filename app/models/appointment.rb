class Appointment < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  belongs_to :therapist, class_name: "User", foreign_key: :therapists_id
  has_many :prescriptions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  before_create :set_room_name


  validates :date_time, presence: true


  # callback ActiveRecord
  def set_room_name
    client = Twilio::REST::Client.new(ENV["KEY_ID"], ENV["AUTH_TOKEN"])
    room = client.video.rooms.create(unique_name: "#{self.id}_#{Time.now.to_i}")
    self.url_room = room.unique_name
  end
end
