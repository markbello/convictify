class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  # def index
  #   @cellblocks = Cellblock.all
  #   @incident_reports = IncidentReport.all
  #   @prisoners = Prisoner.all
  # end

  def new
    @cellblocks = CellBlock.all
    @latest_incident_reports = IncidentReport.latest_incident_reports
    @prisoners = Prisoner.all
  end

  def create
    @guard = Guard.find_by(username: params[:username])
    if @guard && @guard.authenticate(params[:password])
     session[:user_id] = @guard.id
     redirect_to @guard
    else
     redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
