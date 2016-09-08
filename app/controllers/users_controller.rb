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
        "Thanks! Check your email to create your profile!"
      UserMailer.welcome_email(@user).deliver_later
      redirect_to '/'
    elsif @user.save && params[:email] == params[:email_confirmation] && @user.resident == false
      session[:user_id] = @user.id
      flash[:success] =
        "Thanks! Check your email to create your profile!"
      UserMailer.welcome_email(@user).deliver_later
      redirect_to '/'
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
