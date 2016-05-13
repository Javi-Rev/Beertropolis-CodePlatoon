class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  require 'pp'

  def omg
    # cookies.delete 'latlon'
    @cookies = cookies.to_h

    # now probably move these to helper methods in application controller
    @latitude, @longitude =
      cookies['latlon'].to_s.split('|')
      .map(&:to_f)
  end
end
