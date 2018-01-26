class CellBlock < ApplicationRecord
  has_many :cells
  has_many :prisoners, through: :cells
  has_many :guards

  def guard_list
    self.guards
  end

  def cell_block_prisoner_count
    total = 0
    self.cells.each do |cell|
      total += cell.prisoners.count
    end
    total
  end

  def most_common_incidents
    all_incidents = []
    self.prisoners.each do |prisoner|
      prisoner_incident_types = prisoner.incident_reports.map do |incident_report|
        incident_report.incident_type
      end
      all_incidents += prisoner_incident_types
    end
    freq = all_incidents.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    most_frequent = all_incidents.max_by { |v| freq[v] }
  end
end
