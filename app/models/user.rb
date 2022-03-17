class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_one_attached :photo

   # [...]
   include PgSearch::Model
   pg_search_scope :search_by_name_and_speciality,
     against: [ :first_name, :speciality ],
     using: {
       tsearch: { prefix: true } # <-- now `superman batm` will return something!
     }
end
