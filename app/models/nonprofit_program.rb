class NonprofitProgram < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  validates :user_id, :program_id, presence: true
end
