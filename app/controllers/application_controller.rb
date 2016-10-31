class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
  	@user = User.find_by_username(session[:logged_user])
  end

  before_filter :set_cache_headers

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
