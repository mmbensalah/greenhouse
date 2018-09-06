class Plant < ApplicationRecord
  belongs_to :green_house
  has_many :favorites
  has_many :users, through: :favorites
  
  validates_presence_of :name, :variety, :sell_quantity, :stock_plants, :zone, :shipping
  scope :ordered_plants, -> { order(name: :asc) }

end
