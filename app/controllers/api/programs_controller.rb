class Api::ProgramsController < ApplicationController
  before_action :authenticate_user_status!, only: [:new, :create, :edit, :update, :destroy]
end
