class Api::AideTypesController < ApplicationController
  def create
    program = Program.find_by(id: params[:id])
    @aide_type = AideType.create(
      user_id: current_user.id,
      program_id: program.id,
      support_status: params[:support_status],
      volunteer: params[:volunteer],
      donation: params[:donation]
    )
  end
end
