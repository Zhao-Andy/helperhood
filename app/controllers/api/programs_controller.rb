class Api::ProgramsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user_status!, only: [:new, :create, :edit, :update, :destroy]

  def edit
    @program = Program.find_by(id: params[:id])
  end

  def index
    @programs = Program.all
  end

  def map_index
    @nonprofit_programs_array = NonprofitProgram.where(user_id: current_user.id)
    @donations_array = Donation.where(user_id: current_user.id)
  end

  def nonprofit_index
    @nonprofit_programs_array = NonprofitProgram.where(user_id: current_user.id)
    @donations_array = Donation.all
  end

  def resident_index
    # redirect_to '/np-programs.json' and return nil unless current_user.resident
    @resident_programs_array = ResidentProgram.where(user_id: current_user.id)
    @donations_array = Donation.where(user_id: current_user.id)
    # @programs_array = @resident_programs_array.empty? ? @donations_array : @resident_programs_array
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def create
    @program = Program.create(
      name: params[:name],
      description: params[:description],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      donation_goal: params[:donation_goal],
      total_donated: 0,
      start_date: params[:start_date],
      end_date: params[:end_date],
      latitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[0],
      longitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[1]
    )
    if @program.valid?
      NonprofitProgram.create(
        user_id: current_user.id,
        program_id: @program.id
      )
      render json: {success: "Program was created!"} and redirect_to
    else
      render json: {danger: @program.errors.full_messages}
    end
  end

  def update
    @program = Program.find_by(id: params[:id])
    if @program.update(
      name: params[:name],
      description: params[:description],
      donation_goal: params[:donation_goal],
      start_date: params[:start_date],
      end_date: params[:end_date],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      latitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[0],
      longitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[1]
    )
      render json: {success: "Program updated successfully!"}
    else
      render json: {danger: @program.errors.full_messages}
    end
  end

  def destroy
    @program = Program.find_by(id: params[:id])
    @program.destroy
    render json: {info: "Program deleted!"}
  end
end
