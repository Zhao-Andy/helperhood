class Api::DonationsController < ApplicationController
  before_action :current_user
  def create
    program = Program.find_by(id: params[:id])
    donation = Donation.create(
      user_id: current_user.id,
      program_id: program.id,
      donation_amount: params[:donation_amount]
    )
    if donation.valid?
    end
  end

  def show
    @donation = Donation.find_by(id: params[:id])
  end

  def index
    @donations = Donation.all
  end
end
