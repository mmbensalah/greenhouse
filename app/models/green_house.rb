class GreenHouse < ApplicationRecord
  has_many :plants
  validates_presence_of :name, :location
end
