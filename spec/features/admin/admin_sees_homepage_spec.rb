require 'rails_helper'

describe "User visits admin homepage" do
  context 'admin' do
    it 'allows admin to see all buttons for admin' do
      admin = User.create(username: 'penelope', password: '1234', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_homepage_path
    end
  end
end
