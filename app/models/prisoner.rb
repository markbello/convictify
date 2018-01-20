class Prisoner < ApplicationRecord
  belongs_to :cell
  has_many :incident_reports
  has_many :guards, through: :incident_reports

  #See notes on Guard model. Using the incident_participants table with foreign keys of :defendant and :plaintiff is causing the error ActiveRecord::StatementInvalid: SQLite3::SQLException: no such column: incident_reports.prisoner_id
end
