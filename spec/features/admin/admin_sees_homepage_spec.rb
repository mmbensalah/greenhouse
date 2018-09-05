require 'rails_helper'

describe "Admin visits admin homepage" do
  context 'as an admin' do
    it 'admin can visit admin homepage' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      gh = GreenHouse.create!(name: 'GH1', location: 'Lakewood')
      p1 = gh.plants.create!(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')
      p2 = gh.plants.create!(name: 'OP13', variety: 'flower', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots', image: '/image')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_homepage_index_path

      expect(page).to have_content('Administrator Homepage')

      click_on 'View all plants'

      expect(current_path).to eq(plants_path)
      expect(page).to have_content('List of all plants')
      expect(page).to have_content(p1.name)
      expect(page).to have_link(p1.name)
      expect(page).to have_content(p2.name)
      expect(page).to have_link(p2.name)
    end
  end
  context 'as default user' do
    it 'does not allow default user to see admin homepage index' do
      user = User.create(username: 'penelope', password: '1234', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_homepage_index_path

      expect(page).to_not have_content('Administrator Homepage')
      expect(page).to have_content('The page you were looking for doesn\'t exist.')
    end
  end
end
