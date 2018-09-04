require 'rails_helper'

describe 'User can see information about plants' do
  it 'can see plant show page' do
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
