class CellBlock < ApplicationRecord
  has_many :cells
  has_many :prisoners, through: :cells
  has_many :guards
end
