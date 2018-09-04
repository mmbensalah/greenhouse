class Plant < ApplicationRecord
  validates_presence_of :name, :variety, :sell_quantity, :stock_plants, :zone, :shipping
end
