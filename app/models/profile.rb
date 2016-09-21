class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :address, :zipcode, presence: true
  mount_uploader :photo, ProfilePhotoUploader

  def street
    address.nil? ? nil : address.split(',')[0]
  end

  def city
    address.nil? ? nil : address.split(',')[1].lstrip
  end

  def state
    address.nil? ? nil : address.split(',')[2].lstrip
  end

end
