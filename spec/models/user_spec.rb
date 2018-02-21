require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid "User" factory' do
    expect(build(:user)).to_not be_nil
  end

  it 'is valid with a username, email and password' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a username' do
    expect(build(:user, username: nil)).to_not be_valid
  end

  it 'is invalid without an email' do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it 'is invalid without a password' do
    expect(build(:user, password: nil)).to_not be_valid
  end

  it 'is only valid when password is 8 characters or more' do
    expect(build(:user, password: '123456')).to_not be_valid
    expect(build(:user, password: '12345678')).to be_valid
  end

  it 'encrypts the password upon saving' do
    user = build(:user)
    password = user.password
    user.save

    expect(User.last.password).to be_nil
    expect(password).to_not eq(User.last.encrypted_password)
  end
end
