class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :address, :zipcode, presence: true
end
