class ResidentProgramsController < ApplicationController
  def create
    program = Program.find_by(id: params[:id])
    resident_program = ResidentProgram.create(
      user_id: current_user.id,
      program_id: program.id,
      support_status: params[:support_status],
      volunteer: params[:volunteer]
    )
  end
end
