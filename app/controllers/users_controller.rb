class UsersController < ApplicationController
  rescue_from CanCan::AccessDenied do |e|
    redirect_to new_user_path
  end

  before_action :set_user, only: [:edit, :update]

  def index
    @user = User.new
    authorize! :read, @user
  end

  def create
  	# @user = User.where('username = ? OR email = ?', params[:user][:username], params[:user][:email])
    @user = User.new(user_params)

  	if @user.save
  		return redirect_to new_session_path
  	else
      render :new
    end
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def update
    @user.role = Role.find_by_name("admin")
    @user.save
    redirect_to users_path
  end

  private 

  def user_params
  	params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
