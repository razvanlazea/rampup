class UsersController < ApplicationController
  def index
  end

  def create
  	@user = User.new(user_params)
  	@user.save
  	redirect_to new_user_path
  end

  def new
  	@user = User.new
  end

  def user_params
  	params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
  end
end
