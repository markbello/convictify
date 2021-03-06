class PrisonersController < ApplicationController
  #Find and replace all Prisoner, prisoner, and prisoners with the Prisoner name
#Remember to add resources :prisoners, only [:index, etc.] to config/routes.rb

  before_action :set_prisoner, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def index
    #.inmates class method eliminates the firt prisoner which is Prison Official
    @inmates = Prisoner.inmates
    @guard = Guard.find(session[:user_id])
    @latest_prisoners = Prisoner.latest_prisoners
    @latest_incident_reports = IncidentReport.latest_incident_reports
  end

  def show
  end

  def new
    @prisoner = Prisoner.new
  end

  def create
    #byebug
    @prisoner = Prisoner.new(prisoner_params)
    @prisoner.convictify(prisoner_params[:first_name])

    if @prisoner.valid?
      # byebug
      @prisoner.guards << Guard.find(session[:user_id])
      redirect_to @prisoner
    else
      flash[:error] = @prisoner.errors.full_messages
      redirect_to new_prisoner_path
    end
  end

  def edit
    render :edit
  end

  def update
    # byebug
    @prisoner.update(prisoner_params)

    if @prisoner.valid?
      redirect_to @prisoner
    else
      flash[:error] = @prisoner.errors.full_messages
      redirect_to edit_prisoner_path(@prisoner)
    end
  end

  def destroy
    @prisoner.destroy

    redirect_to prisoners_path
  end

  private

  def prisoner_params
    params.require(:prisoner).permit(
      :first_name,
      :last_name
    )

    # Use the below if integrating an array of foreign keys
    # params.require(:prisoner).permit(#:name, foreign_ids: [])
  end

  def set_prisoner
    @prisoner = Prisoner.find(params[:id])
  end

end
