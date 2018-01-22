class GuardPrisoner < ApplicationRecord
  belongs_to :guard
  belongs_to :prisoner
end
