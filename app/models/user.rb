class User < ActiveRecord::Base
  has_one :profile
  has_one :aide_type
  has_many :user_programs
  has_many :programs, through: :user_programs
  validates :email, :password_digest, presence: true
  validates_presence_of :resident, in: [true, false] 
  validates :password_digest, confirmation: true

  has_secure_password
end
