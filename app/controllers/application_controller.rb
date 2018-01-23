class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized
  helper_method :logged_in?


  def current_guard
    if session[:guard_id]
      @guard = Guard.find_by(id: session[:guard_id])
    else
    end
  end


  def logged_in?
    !!current_guard
  end


  def authorized
    redirect_to login_path unless logged_in?
  end

end
