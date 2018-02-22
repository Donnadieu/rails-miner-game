require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it 'has a valid "Wallet" factory' do
    expect(build(:wallet)).to be_valid
  end

  it 'has a "limit" attribute' do
    wallet = build(:wallet, limit: 500.00)

    expect(wallet.limit).to_not be_nil
    expect(build(:wallet)).to be_valid
  end

  it 'has a "balance" attribute' do
    wallet = build(:wallet, balance: 200.00)

    expect(wallet.balance).to_not be_nil
    expect(build(:wallet)).to be_valid
  end

  describe 'Assosciation with Coin' do
    it 'has many coins' do
      wallet = create(:wallet)

      expect(wallet.coins.build).to be_instance_of(Coin)
    end
  end
end
