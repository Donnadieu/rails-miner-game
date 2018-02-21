require 'rails_helper'

RSpec.describe Coin, type: :model do
  it 'has a valid "Coin" factory' do
    expect(build(:coin)).to be_valid
  end

  it 'has a name' do
    coin = build(:coin)

    expect(coin.name).not_to be_nil
  end

  it 'has a symbol' do
    coin = build(:coin)

    expect(coin.symbol).not_to be_nil
  end

  it 'has a difficulty' do
    coin = build(:coin)

    expect(coin.difficulty).not_to be_nil
  end

  it 'has a price' do
    coin = build(:coin)

    expect(coin.price).not_to be_nil
  end
end
