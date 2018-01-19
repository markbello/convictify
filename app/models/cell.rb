class Cell < ApplicationRecord
  belongs_to :cell_block
  has_many :prisoners
end
