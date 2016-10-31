class SessionsController < ApplicationController
  
  def index

  end

  def new
    if !session[:logged_user].blank?
      redirect_to sessions_path
    end
  end

  def create
  	@user = User.find_by_username(params[:session][:username])
  	key = Blowfish::Key.generate('123456')

  	unless @user.nil?
  		decrypted_pass = Blowfish.decrypt(@user.password, key)
  		if decrypted_pass == params[:session][:password]
  			session[:logged_user] = @user.username
  			redirect_to sessions_path and return
  		end
  	end
  	flash[:notice] = "Wrong username and/or password"
  	redirect_to :back
  end

  def delete
  end

  def destroy
    session[:logged_user] = nil
    redirect_to new_session_path
  end

end
