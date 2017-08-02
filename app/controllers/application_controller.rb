require 'rest-client'
require 'json'
require 'dotenv'

Dotenv.load('.env')

  STOCK_PHOTOS = [
    'stock_photo1.jpg',
    'stock_photo2.jpg',
    'stock_photo3.jpg',
    'stock_photo4.jpg',
    'stock_photo5.jpg',
    'stock_photo6.jpg',
    'stock_photo7.jpg',
    'stock_photo8.jpg',
    'stock_photo9.jpg'
  ]


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
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
