class AideType < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  # JS

  def volunteer_status!
    @aidetype.update(
      volunteer_status: params[:support_status]
    )
  end

  # JS

  def support_program!
    @aidetype.update(
      support_status: params[:support_status]
    )
  end

  # Stripe/PayPal

  def donation_amount
    @aidetype.update(
      donation: params[:donation]
    )
  end
end
