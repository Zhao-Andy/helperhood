class ProfilesController < ApplicationController
  before_action :current_user

  def new_nonprofit
    # nonprofit profile new page
    if current_user.resident == false
      render 'new_nonprofit.html.erb'
    else redirect_to '/profile/resident/new'
    end
  end

  def new_resident
    # resident profile new page
    if current_user.resident
      render 'new_resident.html.erb'
    else redirect_to '/profile/nonprofit/new'
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
    @profile = Profile.find_by(user_id: current_user.id)
    unless @profile
      redirect_to '/profile/resident/new'
    end
  end

  def create
    @profile = Profile.create(
      name: params[:name],
      description: params[:description],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      profile_img: params[:profile_img],
      user_id: current_user.id
    )
    if @profile.save
      flash[:success] = "Successfully created profile!"
      if current_user.resident
        redirect_to '/programs'
      else redirect_to '/programs/new'
      end
    else
      flash[:danger] = @profile.errors.full_messages
      render 'new'
    end
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(
      name: params[:name],
      description: params[:description],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      profile_img: params[:profile_img]
    )
      flash[:success] = "Profile successfully updated!"
      redirect_to '/profile'
    else
      flash[:danger] = @profile.errors.full_messages
      render 'edit'
    end
  end
end
