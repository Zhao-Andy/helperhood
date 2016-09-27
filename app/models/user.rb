class User < ActiveRecord::Base
  has_one :profile
  has_one :resident_program
  has_many :donations
  has_many :nonprofit_programs
  has_many :programs, through: :nonprofit_programs
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :resident, inclusion: { in: [true, false], message: "You forgot to pick your account type!"}
  validates :password_digest, confirmation: true

  has_secure_password
end
