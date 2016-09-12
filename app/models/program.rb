class Program < ActiveRecord::Base
  has_many :aide_types
  has_many :user_programs
  has_many :users, through: :user_programs

  def nonprofit_programs
    @nonprofit = User.where(resident: false)
    @nonprofit.programs
  end
end
