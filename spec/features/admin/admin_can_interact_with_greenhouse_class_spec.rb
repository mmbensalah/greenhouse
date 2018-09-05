require 'rails_helper'

describe 'Admin can interact with greenhouse class' do
  before(:each) do
    admin = User.create(username: 'penelope', password: '1234', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  context 'as an admin' do
    it 'admin can view all greenhouses' do
      gh = GreenHouse.create(name: 'gh1', location: 'denver')

      visit admin_green_houses_path

      expect(page).to have_content(gh.name)
      expect(page).to have_content(gh.location)
    end
    it 'admin can create a greenhouse' do
      name = 'gh1'
      location = 'denver'

      visit new_admin_green_house_path

      fill_in :green_house_name, with: 'gh1'
      fill_in :green_house_location, with: 'denver'

      click_on 'Create greenhouse'

      expect(current_path).to eq(admin_green_house_path(GreenHouse.last.id))

      expect(page).to have_content(name)
      expect(page).to have_content(location)
    end
    it 'admin can edit a greenhouse' do
      gh = GreenHouse.create(name: 'gh1', location: 'denver')

      name = 'gh2'
      location = 'lakewood'

      visit edit_admin_green_house_path(gh)

      fill_in :green_house_name, with: name
      fill_in :green_house_location, with: location

      click_on 'Submit changes'

      expect(current_path).to eq(admin_green_house_path(GreenHouse.last.id))

      expect(page).to have_content(name)
      expect(page).to have_content(location)
    end
  end

end
