require 'rails_helper'

RSpec.describe Coin, type: :model do
  before do
    @user = create(:user)
    @wallet = create(:wallet, user_id: @user.id)
  end
  it 'has a valid "Coin" factory' do
    expect(build(:coin, wallet_id: @wallet.id)).to be_valid
  end

  it 'has a name' do
    coin = build(:coin, wallet_id: @wallet.id)

    expect(coin.name).not_to be_nil
  end

  it 'has a symbol' do
    coin = build(:coin, wallet_id: @wallet.id)

    expect(coin.symbol).not_to be_nil
  end

  it 'has a difficulty' do
    coin = build(:coin, wallet_id: @wallet.id)

    expect(coin.difficulty).not_to be_nil
  end

  it 'has an amount' do
    coin = build(:coin, wallet_id: @wallet.id)

    expect(coin.amount).not_to be_nil
  end

  describe 'Assosciation with Wallet' do
    it 'belongs to a user through wallet' do
      coin = create(:coin, wallet_id: @wallet.id)

      expect(coin.wallet.user).to be_instance_of(User)
      expect(coin.wallet.user.id).to eq(@user.id)
    end
  end
end
