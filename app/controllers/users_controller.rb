class UsersController < ApplicationController
  rescue_from CanCan::AccessDenied do |e|
    redirect_to new_user_path
  end

  def index
    @user = User.new
    authorize! :read, @user
  end

  def create
  	@user = User.where('username = ? OR email = ?', params[:user][:username], params[:user][:email])
  	if @user.blank?
  		@user = User.new(user_params)
		  @user.role = Role.find_by_name("user")
  		key = Blowfish::Key.generate('123456')
  		pass = params[:user][:password]
  		encrypted = Blowfish.encrypt(pass, key)
  		@user.password = encrypted
  		@user.save
  		redirect_to new_session_path and return
  	end
  	flash[:notice] = "Username and/or email already taken."
  	redirect_to :back
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.role = Role.find_by_name("admin")
    @user.save
    redirect_to users_path
  end

  def user_params
  	params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
  end
end
