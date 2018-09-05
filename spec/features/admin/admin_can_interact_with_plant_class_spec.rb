require 'rails_helper'

describe 'Admin can interact with plant class' do
  context 'as an admin' do
    it 'admin can add new plant' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      GreenHouse.create!(name: 'GH1', location: 'Lakewood')

      name = 'cacti'
      variety = 'hardy'
      sell_quantity = 10
      stock_plants = 1
      shipping = 'roots'
      zone = 'A1'
      image = '/picture'

      visit plants_path

      click_on 'Add plant'

      expect(current_path).to eq(new_admin_plant_path)

      fill_in :plant_name, with: name
      select "GH1", from: "plant[green_house_id]"
      fill_in :plant_variety, with: variety
      fill_in :plant_sell_quantity, with: sell_quantity
      fill_in :plant_stock_plants, with: stock_plants
      fill_in :plant_zone, with: zone
      fill_in :plant_shipping, with: shipping
      fill_in :plant_image, with: '/image'

      click_on 'Submit'

      expect(current_path).to eq(plant_path(Plant.last.id))

      expect(page).to have_content(name)
      expect(page).to have_content(variety)
      expect(page).to have_content(sell_quantity)
      expect(page).to have_content(stock_plants)
      expect(page).to have_content(zone)
      expect(page).to have_content(shipping)
    end
    it 'admin can add new plant' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      gh = GreenHouse.create!(name: 'GH1', location: 'Lakewood')
      plant = gh.plants.create!(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')

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

    it 'admin can edit an existing plant' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      gh = GreenHouse.create!(name: 'GH1', location: 'Lakewood')
      plant = gh.plants.create!(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = 'cacti'
      variety = 'hardy'
      sell_quantity = 10
      stock_plants = 1
      shipping = 'roots'
      zone = 'A1'

      visit plant_path(plant)
      click_on 'Edit plant'

      expect(current_path).to eq(edit_admin_plant_path(plant))

      fill_in :plant_name, with: name
      select "GH1", from: "plant[green_house_id]"
      fill_in :plant_variety, with: variety
      fill_in :plant_sell_quantity, with: sell_quantity
      fill_in :plant_stock_plants, with: stock_plants
      fill_in :plant_zone, with: zone
      fill_in :plant_shipping, with: shipping
      fill_in :plant_image, with: '/images'

      click_on 'Submit changes'

      expect(current_path).to eq(plant_path(plant))

      expect(page).to have_content(name)
      expect(page).to have_content(variety)
      expect(page).to have_content(sell_quantity)
      expect(page).to have_content(stock_plants)
      expect(page).to have_content(zone)
      expect(page).to have_content(shipping)
    end
  end
end
