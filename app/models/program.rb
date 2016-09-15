class Program < ActiveRecord::Base
  has_many :aide_types
  has_many :user_programs
  has_many :users, through: :user_programs
  validates :name, :description, :address, :zipcode, :start_date, :end_date, :donation_goal, presence: true

  def nonprofit_programs
    @nonprofit = User.where(resident: false)
    @nonprofit.programs
  end

  def street
    address.nil? ? nil : address.split(',')[0]
  end

  def city
    address.nil? ? nil : address.split(',')[1].lstrip
  end

  def state
    address.nil? ? nil : address.split(',')[2].lstrip
  end

  def authenticate_user_status!
    current_user.resident
  end
end
