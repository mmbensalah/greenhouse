require 'rails_helper'

describe Plant, type: :model do
  describe 'validations' do
    it{ should validate_presence_of :name}
    it{ should validate_presence_of :variety}
    it{ should validate_presence_of :sell_quantity}
    it{ should validate_presence_of :stock_plants}
    it{ should validate_presence_of :shipping}
    it{ should validate_presence_of :zone}
  end
  describe 'relationships' do
    it {should belong_to :green_house }
  end
end
