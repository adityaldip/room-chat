require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(username: "testuser", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without a username" do
    @user.username = " "
    expect(@user).to_not be_valid
  end

  it "is not valid with a duplicate username" do
    @user.save
    duplicate_user = User.new(username: "testuser", email: "another@example.com", password: "password", password_confirmation: "password")
    expect(duplicate_user).to_not be_valid
  end

  it "returns the correct gravatar_url" do
    expected_url = "https://gravatar.com/avatar/#{Digest::MD5::hexdigest(@user.email).downcase}.png"
    expect(@user.gravatar_url).to eq(expected_url)
  end
end
