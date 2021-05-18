class UsersController < ApplicationController
  before_action :find_params, only: %i[edit create new update]

  def edit; end

  def create; end

  def new; end

  def update; end

  def find_params
    params.require(:user).permit(:email, :username, :password)
  end
end
