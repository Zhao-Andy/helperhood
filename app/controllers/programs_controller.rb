class ProgramsController < ApplicationController
  before_action :authenticate_user_status!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @programs = Program.all
  end

  def user_index
    @user_programs_array = UserProgram.where(user_id: current_user)
  end

  def new
    @program = Program.new
  end

  def edit
    @program = Program.find_by(id: params[:id])
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
      end_date: params[:end_date]
    )
    if @program.valid?
      UserProgram.create(
        user_id: current_user.id,
        program_id: @program.id
      )
      flash[:success] = "#{@program.name} was successfully created!"
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
      zipcode: params[:zipcode]
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

  def nonprofit
    @program = UserProgram.where(user_id: current_user.id)
  end
end
