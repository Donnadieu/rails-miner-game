require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid "User" factory' do
    expect(build(:user)).to be_valid
  end

  it 'is valid with a username, email and password' do

  end

  it 'is invalid without a username' do

  end

  it 'is invalid without an email' do

  end

  it 'is invalid without a password' do

  end

  it 'is invalid without a valid email' do

  end

  it 'encrypts the password upon saving' do

  end
end
