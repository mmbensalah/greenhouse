class Plant < ApplicationRecord
  belongs_to :green_house
  validates_presence_of :name, :variety, :sell_quantity, :stock_plants, :zone, :shipping
  scope :ordered_plants, -> { order(name: :asc) }

end
