class GreenHouse < ApplicationRecord
  has_many :plants
  validates_presence_of :name, :location

  def plant_count
    plants.count
  end
end
