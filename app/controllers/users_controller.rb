class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      resident: params[:resident]
    )
    if @user.save && params[:email] == params[:email_confirmation] && @user.resident
      session[:user_id] = @user.id
      flash[:success] =
        "Thanks! Let's create your profile!"
      redirect_to '/profile/resident/new'
    elsif @user.save && params[:email] == params[:email_confirmation] && @user.resident == false
      session[:user_id] = @user.id
      flash[:success] =
        "Thanks! Let's create your profile!"
      redirect_to '/profile/nonprofit/new'
    else
      flash[:danger] = @user.errors.full_messages
      render 'new.html.erb'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
  end
end
