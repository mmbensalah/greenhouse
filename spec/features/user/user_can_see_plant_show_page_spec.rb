require 'rails_helper'

describe 'User can see information about plants' do
  it 'plant index page renders correctly' do
    user = User.create(username: 'penelope', password: '1234', role: 0)
    gh = GreenHouse.create!(name: 'GH1', location: 'Lakewood')
    p1 = gh.plants.create!(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')
    p2 = gh.plants.create!(name: 'OP13', variety: 'flower', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')

    visit plants_path

    expect(page).to have_content('List of all plants')
    expect(page).to have_content(p1.name)
    expect(page).to have_link(p1.name)
    expect(page).to have_content(p2.name)
    expect(page).to have_link(p2.name)
  end
  it 'plant show page renders correctly' do
    gh = GreenHouse.create!(name: 'GH1', location: 'Lakewood')
    p1 = gh.plants.create!(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')

    visit plants_path
    click_on 'OP12'

    expect(current_path).to eq(plant_path(p1))

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p1.variety)
    expect(page).to have_content(p1.sell_quantity)
    expect(page).to have_content(p1.stock_plants)
    expect(page).to have_content(p1.zone)
    expect(page).to have_content(p1.shipping)
  end
end
