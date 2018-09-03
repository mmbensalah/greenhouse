require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}

  it "uniqueness of username" do
    orig = User.create(username: "user", password: "Password")
    copy_cat = User.new(username: "user", password: "Password")

    expect(copy_cat).to_not be_valid
    end
  end
end
