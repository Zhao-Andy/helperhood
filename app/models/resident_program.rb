class ResidentProgram < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  validates :user_id, :program_id, :volunteer, :support_status, presence: true
end
