require 'rails_helper'

describe 'User can' do
  it 'log in to a session' do
    visit '/'
    user = User.create(username: 'fonzi4', password: 'test')

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on 'Log in'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log out")
  end
end
