class AideTypesController < ApplicationController
  def create
    @program = Program.find_by(id: params[:id])
    @aide_type = AideType.create(
      user_id: current_user.id,
      program_id: @program.id,
      support_status: params[:support_status],
      volunteer: params[:volunteer],
      donation: params[:donation]
    )
  end

  def volunteer_status
    current_program
    @aidetype.update(
      volunteer_status: params[:support_status]
    )
  end

  def support_program
    current_program
    @aidetype.update(
      support_status: params[:support_status]
    )
  end

  def donation_amount
    current_program
    @aidetype.update(
      donation: params[:donation]
    )
  end

  def destroy
  end
end
