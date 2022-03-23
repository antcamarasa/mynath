class Appointment < ApplicationRecord
  require 'twilio-ruby'
  belongs_to :user, foreign_key: :users_id
  belongs_to :therapist, class_name: "User", foreign_key: :therapists_id
  has_many :prescriptions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  before_create :set_room_name


  validates :date_time, presence: true
  validates :time, presence: true


  # callback ActiveRecord
  def set_room_name
    client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["API_KEY_SECRET"])
    room = client.video.rooms.create(unique_name: "#{self.users_id}_#{Time.now.to_i}")
    self.url_room = room.unique_name
  end
end
