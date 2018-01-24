class IncidentReportsController < ApplicationController
  #Find and replace all IncidentReport, incident_report, and incident_reports with the IncidentReport name
#Remember to add resources :incident_reports, only [:index, etc.] to config/routes.rb

  before_action :set_incident_report, only: [:show, :edit, :update, :destroy]

  def index
    set_incident_reports
  end

  def show
    @guards = Guard.all
    @incident_types = IncidentType.all
    @prisoners = Prisoner.all
  end

  def new
    @incident_report = IncidentReport.new
  end

  def create
    #byebug
    @plaintiff = params[:incident_report][:incident_participants][:plaintiff_id]
    @defendant = params[:incident_report][:incident_participants][:defendant_id]
    @incident_participant_plaintiff = IncidentParticipant.new(prisoner_id: @plaintiff, prisoner_type: 1)
    @incident_participant_defendant = IncidentParticipant.new(prisoner_id: @defendant, prisoner_type: 2)
    # byebug
    @incident_report = IncidentReport.new(incident_report_params)
    @incident_report[:guard_id] = 1
    @incident_report.save
    @incident_participant_plaintiff[:incident_report_id] = @incident_report.id
    @incident_participant_defendant[:incident_report_id] = @incident_report.id
    @incident_participant_plaintiff.save
    @incident_participant_defendant.save
    if @incident_report.valid?
      redirect_to @incident_report
    else
      flash[:error] = @incident_report.errors.full_messages
      redirect_to new_incident_report_path
    end
  end

  def edit

  end

  def update
    @incident_report.update(incident_report_params)

    if @incident_report.valid?
      redirect_to @incident_report
    else
      flash[:error] = @incident_report.errors.full_messages
      redirect_to edit_incident_report_path(@incident_report)
    end
  end

  def destroy
    @incident_report.destroy

    redirect_to incident_reports_path
  end

  private

  def incident_report_params
    params.require(:incident_report).permit(
      :content,
      :incident_type_id
    )
  end

  def set_incident_report
    @incident_report = IncidentReport.find(params[:id])
  end

  def set_incident_reports
    @incident_reports = IncidentReport.all
  end

  # def set_foreign
  #   @foreigns = @incident_report.foreigns
  # end

end
