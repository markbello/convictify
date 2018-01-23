class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @guard = Guard.find_by(username: params[:username])
    if @guard && @guard.authenticate(params[:password])
     session[:guard_id] = @guard.id
     redirect_to @guard
    else
     redirect_to login_path
    end
  end

  def destroy
    session.delete(:guard_id)
    redirect_to login_path
  end

end