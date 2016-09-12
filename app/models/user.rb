class User < ActiveRecord::Base
  has_one :profile
  has_one :aide_type
  has_many :user_programs
  has_many :programs, through: :user_programs
  validates :email, :password_digest, presence: true
  validates :resident, inclusion: { in: [true, false], message: "You forgot to pick your account type!"}
  validates :password_digest, confirmation: true

  has_secure_password
end
