class Label < ApplicationRecord
  has_many :plant_labels, dependent: :destroy
  has_many :plants, through: :plant_labels
end
