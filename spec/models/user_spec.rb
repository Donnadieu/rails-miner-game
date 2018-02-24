require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
    @wallet = create(:wallet, user_id: @user.id)
    @coin_one = create(:coin, wallet_id: @wallet.id)
    @coin_two = create(:coin, wallet_id: @wallet.id)
    @mining_rig = create(:mining_rig, user_id: @user.id)
  end
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

  describe 'Assosciations' do
    it 'has many mining rigs' do
      user = create(:user)

      expect(user.mining_rigs.build).to be_instance_of(MiningRig)
    end

    it 'has one wallet' do
      expect(@user.wallet).to be_instance_of(Wallet)
      expect(@user.wallet.id).to eq(@wallet.id)
    end

    it 'has many coins, through a wallet' do
      expect(@user.coins.count).to eq(2)
      expect(@user.coins).to include(@coin_one)
      expect(@user.coins).to include(@coin_two)
    end

    it 'has many miners, through mining rigs' do
      expect(@mining_rig.miners.build).to be_instance_of(Miner)
    end
  end
end
