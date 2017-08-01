require 'rest-client'
require 'json'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :require_login, :current_user, :logged_in?

  def require_login
    unless logged_in?
      flash[:message] = "You must be logged in to access this section"
      redirect_to welcome_path
    end
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
