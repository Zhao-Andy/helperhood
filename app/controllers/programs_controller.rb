class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def new
    redirect_to '/programs' unless current_user.resident == false
  end

  def edit
    @program = Program.find_by(id: params[:id])
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def create
    user_nonprofit
    @program = Program.create(
      name: params[:name],
      description: params[:description],
      donation_goal: params[:donation_goal],
      total_donated: 0,
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    if @program.valid?
      flash[:success] = "#{@program.name} was successfully created!"
      redirect_to "/programs/#{@program.id}"
    else
      flash[:danger] = @program.errors.full_messages
      render 'show'
    end
  end

  def update
    @program = Program.find_by(id: params[:id])
    @program.update(
      name: params[:name],
      description: params[:description],
      donation_goal: params[:donation_goal],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    render 'show'
  end

  def destroy
    @program = Program.find_by(id: params[:id])
    @program.destroy
    redirect_to "/programs"
  end
end
