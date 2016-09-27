class Api::ProfilesController < ApplicationController
  before_action :current_user
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find_by(id: params[:id])
  end

  def create
    @profile = Profile.create(
      name: params[:name],
      description: params[:description],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      photo: params[:photo],
      user_id: current_user.id,
      latitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[0],
      longitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[1]
    )
    if @profile.save
      flash[:success] = "Successfully created profile!"
      redirect_to "/profile"
    else
      flash[:danger] = @profile.errors.full_messages
      render '/profile/resident/new'
    end
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(
      name: params[:name],
      description: params[:description],
      address: "#{params[:street]}, #{params[:city]}, #{params[:state]}",
      zipcode: params[:zipcode],
      profile_img: params[:profile_img],
      latitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[0],
      longitude: Geocoder.coordinates(
        "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
      )[1]
    )
      render json: {success: "Profile successfully updated!"}
    else
      render json: {danger: @profile.errors.full_messages}
    end
  end
end
