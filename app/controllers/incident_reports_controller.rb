class IncidentReportsController < ApplicationController
  #Find and replace all IncidentReport, incident_report, and incident_reports with the IncidentReport name
#Remember to add resources :incident_reports, only [:index, etc.] to config/routes.rb

  before_action :set_incident_report, only: [:show, :edit, :update, :destroy]

  def index
    set_incident_reports
  end

  def show
  end

  def new
    @incident_report = IncidentReport.new

  end

  def create
    #byebug
    @plaintiff = params[:incident_report][:incident_participants][:plaintiff_id]
    @defendant = params[:incident_report][:incident_participants][:defendant_id]
    @incident_participants = IncidentParticipant.new(plaintiff_id: @plaintiff, defendant_id: @defendant)
    @incident_report = IncidentReport.create(incident_report_params)
    #byebug
    @incident_participants[:incident_report_id] = @incident_report.id
    @incident_participants.save
    if @incident_report.valid?
      redirect_to @incident_report
    else
      flash[:error] = @incident_report.errors.full_messages
      redirect_to new_incident_report_path
    end
  end

  def edit
    render :edit #?
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
      :guard_id,
      :content,
      :incident_type_id
    )


    # <ActionController::Parameters
    # {"utf8"=>"✓", "authenticity_token"=>"PjVyO2XKrDJQP9r+30Z5saF5PDxOhPNEph/HemOeNiMB0El7KF10wD7HW6LkptuqVx93Cjg8JAF18l3B36M7lQ==",
    #
    # "incident_report"=>{
    #   "guard_id"=>"1",
    #   "content"=>"Content test",
    #   "incident_type_id"=>"1",
    #   "incident_participants"=>{
    #     "plaintiff_id"=>"1",
    #     "defendant_id"=>"2"}},
    #
    # "commit"=>"Create Incident report", "controller"=>"incident_reports", "action"=>"create"} permitted: false>

    # Use the below if integrating an array of foreign keys
    # params.require(:incident_report).permit(#:name, foreign_ids: [])
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
