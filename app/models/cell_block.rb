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
end
