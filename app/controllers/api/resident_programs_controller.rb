class Api::ResidentProgramsController < ApplicationController
  before_action :current_user
  skip_before_action :verify_authenticity_token
  def toggle_support_status
    rp = ResidentProgram.find_by(program_id: params[:program_id], user_id: current_user.id)
    if !rp.nil?
      if params[:liked] == 1
        rp.update(support_status: true)
        render json: {success: "Added to your programs!"}
      else
        rp.update(support_status: false)
        render json: {success: "Removed from your programs!"}
      end
    else
      ResidentProgram.create(user_id: current_user.id, program_id: params[:program_id], support_status: true)
      render json: {success: "Added to your programs!"}
    end
  end

  def show
    @resident_program = ResidentProgram.find_by(id: params[:id])
  end

  def index
    @resident_programs = ResidentProgram.all
  end

  def toggle_volunteer_status
    rp = ResidentProgram.find_by(program_id: params[:program_id], user_id: current_user.id)
    if !rp.nil?
      if params[:volunteer] == 1
        rp.update(volunteer: true)
        render json: {success: "Volunteering!"}
      else
        rp.update(volunteer: false)
        render json: {success: "Not volunteering!"}
      end
    else
      ResidentProgram.create(user_id: current_user.id, program_id: params[:program_id], volunteer: true)
      render json: {success: "Added to your programs!"}
    end
  end
end
