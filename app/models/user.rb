class User < ActiveRecord::Base
  has_one :profile
  has_one :aide_type
  has_many :user_programs
  has_many :programs, through: :user_programs
end
