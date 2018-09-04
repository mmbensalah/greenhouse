require 'rails_helper'

describe "User visits admin homepage" do
  context 'admin' do
    it 'allows admin to see all buttons for admin' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      plant = Plant.create(name: 'OP12', variety: 'cactus', sell_quantity: 10, stock_plants: 1, zone: 'A4', shipping: 'roots')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_homepage_index_path

      expect(page).to have_content('Administrator Homepage')
      expect(page).to have_link('List all plants')

      click_on 'List all plants'

      expect(current_path).to eq(plants_path)
      expect(page).to have_content('List of all plants')
      expect(page).to have_content(plant.name)
    end
  end
  # context 'as default user' do
  #   it 'does not allow default user to see admin homepage index' do
  #     user = User.create(username: 'penelope', password: '1234', role: 0)
  #
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #     visit admin_homepage_index_path
  #
  #     expect(page).to_not have_content('Administrator Homepage')
  #     expect(page).to have_content('The page you were looking for doesn\'t exist.')
  #   end
  # end
end
