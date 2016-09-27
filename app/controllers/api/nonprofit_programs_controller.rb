class Api::NonprofitProgramsController < ApplicationController
  before_action :current_user
  def create
    program = Program.find_by(id: params[:id])
    nonprofit_program = NonprofitProgram.create(
      user_id: current_user.id,
      program_id: program.id
    )
    if nonprofit_program.valid?
    end
  end

  def show
    @nonprofit_program = NonprofitProgram.find_by(id: params[:id])
  end

  def index
    @nonprofit_programs = NonprofitProgram.all
  end
end
