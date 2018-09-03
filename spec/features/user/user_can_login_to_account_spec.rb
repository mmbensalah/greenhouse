require 'rails_helper'

describe 'User can' do
  it 'log in to a session' do
    visit '/'
    user = User.create(username: 'fonzi4', password: 'test', role: 'admin')

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    fill_in "role", with: user.role

    click_on 'Log in'

    expect(current_path).to eq(admin_homepage_index_path)
    expect(page).to have_content("Administrator Homepage")
    expect(page).to have_content("Log Out")
  end
end
