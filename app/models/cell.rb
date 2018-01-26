class Cell < ApplicationRecord
  belongs_to :cell_block
  has_many :prisoners

  def prisoner_count
    if self.id == 1
      self.prisoners.count - 1
    else
      self.prisoners.count
    end
  end
end
