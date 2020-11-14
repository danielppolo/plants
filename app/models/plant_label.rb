class PlantLabel < ApplicationRecord
  validates :label, presence: true, uniqueness: { scope: :plant }
  validates :plant, presence: true

  belongs_to :plant
  belongs_to :label
end
