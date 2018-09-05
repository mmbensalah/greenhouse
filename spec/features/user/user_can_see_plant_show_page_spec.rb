require 'rails_helper'

describe 'User can see information about plants' do
  it 'plant index page renders correctly' do
    user = User.create(username: 'penelope', password: '1234', role: 0)
    plant = Plant.create(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')
    plant_1 = Plant.create(name: 'OP13', variety: 'succulent', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')
    plant_2 = Plant.create(name: 'OP14', variety: 'yucca', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')

    visit plants_path

    expect(page).to have_content('List of all plants')
    expect(page).to have_content(plant.name)
    expect(page).to have_link(plant.name)
    expect(page).to have_content(plant_1.name)
    expect(page).to have_link(plant_1.name)
    expect(page).to have_content(plant_2.name)
    expect(page).to have_link(plant_2.name)
  end
  it 'plant show page renders correctly' do
    plant = Plant.create(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')

    visit plants_path
    click_on 'OP12'

    expect(current_path).to eq(plant_path(plant))
    expect(page).to have_content(plant.name)
    expect(page).to have_content(plant.variety)
    expect(page).to have_content(plant.sell_quantity)
    expect(page).to have_content(plant.stock_plants)
    expect(page).to have_content(plant.zone)
    expect(page).to have_content(plant.shipping)
  end
end
