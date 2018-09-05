require 'rails_helper'

describe 'Admin can interact with greenhouse class' do
  context 'as an admin' do
    it 'admin can view all greenhouses' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      gh = GreenHouse.create(name: 'gh1', location: 'denver')

      visit admin_green_houses_path

      expect(page).to have_content(gh.name)
      expect(page).to have_content(gh.location)
    end
    # it 'admin can create a greenhouse' do
    #   admin = User.create(username: 'penelope', password: '1234', role: 1)
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    #
    #   visit new_admin_greenhouse_path
    #
    #   fill_in :greenhouse_name, with: 'gh1'
    #   fill_in :greenhouse_location, with: 'denver'
    #
    #   click_on 'Create greenhouse'
    #
    #   expect(page).to have_content(gh.name)
    #   expect(page).to have_content(gh.location)
    # end
  end

end
