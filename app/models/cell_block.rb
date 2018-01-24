class CellBlock < ApplicationRecord
  has_many :cells
  has_many :prisoners, through: :cells
  has_many :guards

  def guard_list
    self.guards
  end
end
