require 'rails_helper'

describe 'Admin can create new plant' do
  context 'as an admin' do
    it 'admin can add new plant' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = 'cacti'
      variety = 'hardy'
      sell_quantity = 10
      stock_plants = 1
      shipping = 'roots'
      zone = 'A1'

      visit plants_path
      click_on 'Add new plant'

      expect(current_path).to eq(new_admin_plant_path)

      fill_in :plant_name, with: name
      fill_in :plant_variety, with: variety
      fill_in :plant_sell_quantity, with: sell_quantity
      fill_in :plant_stock_plants, with: stock_plants
      fill_in :plant_zone, with: zone
      fill_in :plant_shipping, with: shipping

      click_on 'Add plant'
      expect(current_path).to eq(plant_path(Plant.last))

      expect(page).to have_content(name)
      expect(page).to have_content(variety)
      expect(page).to have_content(sell_quantity)
      expect(page).to have_content(stock_plants)
      expect(page).to have_content(zone)
      expect(page).to have_content(shipping)
    end
    it 'admin can add new plant' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      plant = Plant.create(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit plant_path(plant)
      click_on 'Delete plant'

      expect(current_path).to eq(plants_path)

      expect(page).to_not have_content(plant.name)
      expect(page).to_not have_content(plant.variety)
      expect(page).to_not have_content(plant.sell_quantity)
      expect(page).to_not have_content(plant.stock_plants)
      expect(page).to_not have_content(plant.zone)
      expect(page).to_not have_content(plant.shipping)
    end
  end
end
