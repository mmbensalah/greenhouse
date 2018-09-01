require 'rails_helper'

describe 'Visitor can' do
  it 'create a sign in' do
    visit '/'

    click_on "Sign Up To Be A User"
    expect(current_path).to eq new_user_path

    fill_in :user_username, with: 'user_1'
    fill_in :user_password, with: 'test_1'

    click_on "Create User"

    expect(page).to have_content("Welcome, user_1!")

  end
end
