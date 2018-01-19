# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin17]

* Rails version 5.1.4

* System dependencies

- default Rails dependencies

* Configuration

* Database creation

##MODELS AND ASSOCIATIONS

**User**
belongs_to :cell_block, as "guard"
belongs_to :cell, as "prisoner"
has_many :incident_reports


first_name:string
last_name:string
role:string (admin, guard, or prisoner)


**Guard**
belongs_to :cell_block
has_many :incident_reports
has_many :prisoners, through: incident_reports

first_name:string
last_name:string
cell_block:references

**Prisoner**
belongs_to :cell
has_many :guards, through: incident_reports
has_many :incident_reports

first_name:string
last_name:string
release_date:datetime
conviction:string
cell:references

**Cell_Block**
has_many :cells
has_many :prisoners, through: :cells
has_many :guards

name:string
security_rating:integer

**Cell**
belongs_to :cell_block
has_many :prisoners

name:string
cell_block:references

**Incident_Report**
belongs_to :guard
belongs_to :incident_type
has_many: incident_participants

content:text
incident_type:references

**Incident_Participant**
belongs_to: incident_report
belongs_to: prisoner, as :defendant
belongs_to: prisoner, as :plaintiff

defendant, class_name "Prisoner"
plaintiff, class_name "Prisoner"

**Incident_Type**
:has_many :incident_reports

name:string
severity_rating:integer



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
