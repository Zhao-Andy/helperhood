class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  validates :user_id, :program_id, :donation_amount, presence: true

  def self.donation_total(user)
    sum = where(user_id: user.id).map do |donation|
      donation.donation_amount
    end
    sum.reduce(:+)
  end
end
