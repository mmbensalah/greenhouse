require 'rails_helper'

describe "User visits admin homepage" do
  context 'admin' do
    it 'allows admin to see all buttons for admin' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_homepage_index_path
      expect(page).to have_content('Administrator Homepage')
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
