class Plant < ApplicationRecord
  CATEGORIES = %w[
    Annuals
    Bulbs
    Cactus
    Succulents
    Climbers
    Conifers
    Ferns
    Fruit
    Herbs
  ].freeze

  belongs_to :garden
  has_many :plant_labels, dependent: :destroy
  has_many :labels, through: :plant_labels

  validates :name, :image_url, presence: true
end
