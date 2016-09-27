class ProgramsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user_status!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @program = Program.new
  end

  def edit
    @program = Program.find_by(id: params[:id])
  end

  def index
    @programs = Program.all
  end

  def nonprofit_index
    if current_user.resident
      redirect_to '/my-programs'
    else
      @nonprofit_programs_array = NonprofitProgram.where(user_id: current_user.id)
    end
  end

  def resident_index
    redirect_to '/np-programs' and return nil unless current_user.resident
    @resident_programs_array = ResidentProgram.where(user_id: current_user)
    @donations_array = Donation.where(user_id: current_user.id)
    if @resident_programs_array.empty? && @donations_array.empty?
      # add some javascript flash msg
      flash[:warning] = "Looks like you need to find some programs you like first!"
      redirect_to '/programs'
    end
    @programs_array = @resident_programs_array.empty? ? @donations_array : @resident_programs_array
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def res_map_index
    @programs = Program.all
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
      UserProgram.create(
        user_id: current_user.id,
        program_id: @program.id
      )
      flash[:success] = "Program added!"
      redirect_to "/programs/#{@program.id}"
    else
      flash[:danger] = @program.errors.full_messages
      render 'new'
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
      flash[:success] = "#{@program.name} was successfully updated!"
      redirect_to "/programs/#{@program.id}"
    else
      flash[:danger] = @program.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @program = Program.find_by(id: params[:id])
    @program.destroy
    redirect_to "/programs"
  end
end
